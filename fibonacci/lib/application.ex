defmodule Fibonacci.Application do
  use Application

  def start(_type, _args) do
    Fibonacci.start_link()
  end
end