defmodule ComputerClientTest do
  use ExUnit.Case
  doctest ComputerClient

  test "greets the world" do
    assert ComputerClient.hello() == :world
  end
end
