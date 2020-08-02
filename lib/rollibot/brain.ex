defmodule Rollibot.Brain do
  @moduledoc """
    Brain.
  """
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    Rollibot.Light.blink_forever()

    Rollibot.Motors.set_pullups()

    Rollibot.Motors.forward()
    {:ok, []}
  end

end
