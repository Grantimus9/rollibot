defmodule Rollibot.FloorSensors do
  @moduledoc """
    Floor Sensors
  """
  @left_floor_sensor_pin Application.get_env(:rollibot, :left_floor_sensor_pin, 27)
  @right_floor_sensor_pin Application.get_env(:rollibot, :right_floor_sensor_pin, 22)
  @front_floor_sensor_pin Application.get_env(:rollibot, :front_floor_sensor_pin, 10)

end
