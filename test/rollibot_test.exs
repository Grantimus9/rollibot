defmodule RollibotTest do
  use ExUnit.Case
  doctest Rollibot

  test "greets the world" do
    assert Rollibot.hello() == :world
  end

  test "Circuits.GPIO testing with HAL example" do
    # HAL supports 64 pins, and each even is linked to the next odd pin.
    # https://github.com/elixir-circuits/circuits_gpio#testing
    {:ok, gpio0} = Circuits.GPIO.open(0, :output)
    {:ok, gpio1} = Circuits.GPIO.open(1, :input)

    # Assert both are 0 to start
    assert 0 = Circuits.GPIO.read(gpio0)
    assert 0 = Circuits.GPIO.read(gpio1)

    # Set the output to high.
    :ok = Circuits.GPIO.write(gpio0, 1)

    # Assert the output is now high.
    assert 1 = Circuits.GPIO.read(gpio0)
    # Assert its HAL-paired input pin is also high.
    assert 1 = Circuits.GPIO.read(gpio1)

    # Set both back to 0
    :ok = Circuits.GPIO.write(gpio0, 0)
    assert 0 = Circuits.GPIO.read(gpio0)
    assert 0 = Circuits.GPIO.read(gpio1)
  end


end
