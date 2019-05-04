defmodule Procs do
  # def greeter(name) do
  #   Process.sleep(1000)
  #   IO.puts("Hello #{name}")
  # end

  def greeter(what_to_say) do
    receive do
      msg ->
        IO.puts "#{what_to_say} #{inspect msg}"
    end
    greeter(what_to_say)
  end

  def greet_counter(count) do
    receive do
      msg -> IO.puts "#{count}: Hello #{inspect msg}"
    end
    greet_counter(count+1)
  end

  def stateful_greeter(count) do
    receive do
      { :add, n } -> 
        stateful_greeter(count + n)
      { :reset } ->
        stateful_greeter(0)
      msg ->
        IO.puts "#{count}: Hello #{inspect msg}"
        stateful_greeter(count)
    end
  end

  def boom_greeter(count) do
    receive do
      { :boom, reason } ->
        exit(reason)
      { :add, n } -> 
        boom_greeter(count + n)
      { :reset } ->
        boom_greeter(0)
      msg ->
        IO.puts "#{count}: Hello #{inspect msg}"
        boom_greeter(count)
      end
  end

  def start(f \\ :stateful_greeter) do
    spawn Procs, f, [0]
  end
end