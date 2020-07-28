defmodule RollibotTest do
  use ExUnit.Case
  doctest Rollibot

  test "greets the world" do
    assert Rollibot.hello() == :world
  end
end
