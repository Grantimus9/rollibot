defmodule Rollibot.Light do
  @moduledoc """
    Breadboard light.
  """
  @breadboard_led_pin Application.get_env(:rollibot, :breadboard_led_pin, 8)
  alias Circuits.GPIO

  def blink_forever() do
    {:ok, gpio} = GPIO.open(@breadboard_led_pin, :output)
    spawn(fn -> toggle_pin_forever(gpio) end)
  end

  defp toggle_pin_forever(output_gpio) do
    GPIO.write(output_gpio, 1)
    Process.sleep(500)
    GPIO.write(output_gpio, 0)
    Process.sleep(500)
    toggle_pin_forever(output_gpio)
  end



end
