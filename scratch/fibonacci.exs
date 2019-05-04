defmodule FAgent do
  
  def start() do
    {:ok, pid} = Agent.start_link(fn -> %{0 => 0, 1 => 1} end)
    pid
  end

  def fib(pid, 0), do: 0
  def fib(pid, 1), do: 1

  def fib(pid, n) do 
    case Agent.get(pid, fn state -> Map.get(state, n) end) do
      nil -> 
        v = fib(pid, n - 1) + fib(pid, n-2)
        Agent.update(pid, fn state -> Map.put(state, n, v) end)
        v
      v   -> v
    end
  end
  
end