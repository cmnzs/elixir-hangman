defmodule Fibonacci do
  
  @me __MODULE__

  def start_link() do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: @me)
  end

  # def fib(_pid, 0), do: 0
  # def fib(_pid, 1), do: 1

  def fib(n) do 
    case Agent.get(@me, fn state -> Map.get(state, n) end) do
      nil -> 
        v = fib(n - 1) + fib(n-2)
        Agent.update(@me, fn state -> Map.put(state, n, v) end)
        v
      v   -> v
    end
  end
  
end