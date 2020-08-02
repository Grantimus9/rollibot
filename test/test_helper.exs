ExUnit.start()

# Ensure the host running the tests can support the Circuits.GPIO Hardware Abstraction Layer
%{name: :stub, pins_open: _} = Circuits.GPIO.info()
