defmodule Rollibot.WallSensors do
  @moduledoc """
    Wall Sensors
  """
  @left_wall_sensor_pin Application.get_env(:rollibot, :left_wall_sensor_pin, 9)
  @right_wall_sensor_pin Application.get_env(:rollibot, :right_wall_sensor_pin, 11)
  @front_wall_sensor_pin Application.get_env(:rollibot, :front_wall_sensor_pin, 7)

  
end
