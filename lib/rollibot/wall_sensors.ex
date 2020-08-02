defmodule Rollibot.WallSensors do
  @moduledoc """
    Wall Sensors
  """
  @left_wall_sensor_pin Application.get_env(:rollibot, :left_wall_sensor_pin, 9)
  @right_wall_sensor_pin Application.get_env(:rollibot, :right_wall_sensor_pin, 11)
  @front_wall_sensor_pin Application.get_env(:rollibot, :front_wall_sensor_pin, 7)

  use GenServer
  alias Circuits.GPIO

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(_) do
    {:ok, gpio_left} = GPIO.open(@left_wall_sensor_pin, :input)
    {:ok, gpio_right} = GPIO.open(@right_wall_sensor_pin, :input)
    {:ok, gpio_front} = GPIO.open(@front_wall_sensor_pin, :input)

    [gpio_left, gpio_right, gpio_front] |> Enum.each(fn(gpio) -> GPIO.set_pull_mode(gpio, :pulldown) end)

    Process.send_after(self(), :read, 20)
    {:ok, %{left: 0, right: 0, front: 0, left_gpio: gpio_left, right_gpio: gpio_right, front_gpio: gpio_front}}
  end

  def handle_info(:read, state) do
    state =
      state
      |> Map.put(:left, GPIO.read(state.left_gpio))
      |> Map.put(:right, GPIO.read(state.right_gpio))
      |> Map.put(:front, GPIO.read(state.front_gpio))

    Process.send_after(self(), :read, 20)

    {:noreply, state}
  end

  def set_pulldowns() do
    [
      @left_wall_sensor_pin,
      @right_wall_sensor_pin,
      @front_wall_sensor_pin,
    ]
    |> Enum.map(fn(p) -> GPIO.open(p, :input) end)
    |> Enum.each(fn({:ok, gpio}) -> GPIO.set_pull_mode(gpio, :pulldown) end)
  end

end
