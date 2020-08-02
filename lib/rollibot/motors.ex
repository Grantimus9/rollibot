defmodule Rollibot.Motors do
  @moduledoc """
    Motors
  """
  @left_forward_pin Application.get_env(:rollibot, :left_forward_pin, 3)
  @right_forward_pin Application.get_env(:rollibot, :right_forward_pin, 4)
  @left_backward_pin Application.get_env(:rollibot, :left_backward_pin, 2)
  @right_backward_pin Application.get_env(:rollibot, :right_backward_pin, 17)

  alias Circuits.GPIO

  def forward() do
    :ok = left_forward()
    :ok = right_forward()

    :ok
  end

  def left_forward() do
    {:ok, left_backward_gpio} = GPIO.open(@left_backward_pin, :output)
    GPIO.write(left_backward_gpio, 0)

    {:ok, output_gpio} = GPIO.open(@left_forward_pin, :output)
    GPIO.write(output_gpio, 1)

    :ok
  end

  def right_forward() do
    {:ok, right_backward_gpio} = GPIO.open(@right_backward_pin, :output)
    GPIO.write(right_backward_gpio, 0)

    {:ok, output_gpio} = GPIO.open(@right_forward_pin, :output)
    GPIO.write(output_gpio, 1)

    :ok
  end

  def set_pullups() do
    [
      @left_forward_pin,
      @right_forward_pin,
      @left_backward_pin,
      @right_backward_pin
    ]
    |> Enum.map(fn(p) -> GPIO.open(p, :output) end)
    |> Enum.each(fn({:ok, gpio}) -> GPIO.set_pull_mode(gpio, :pullup) end)
  end

end
