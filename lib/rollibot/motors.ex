defmodule Rollibot.Motors do
  @moduledoc """
    Motors
  """
  @left_forward_pin Application.get_env(:rollibot, :left_forward_pin, 2)
  @right_forward_pin Application.get_env(:rollibot, :right_forward_pin, 4)
  @left_backward_pin Application.get_env(:rollibot, :left_backward_pin, 3)
  @right_backward_pin Application.get_env(:rollibot, :right_backward_pin, 17)

  alias Circuits.GPIO

  def forward() do
    {:ok, output_gpio} = GPIO.open(@left_forward_pin, :output)
    GPIO.write(output_gpio, 1)
    
    {:ok, output_gpio} = GPIO.open(@right_forward_pin, :output)
    GPIO.write(output_gpio, 1)
  end

end
