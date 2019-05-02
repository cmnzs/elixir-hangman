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
end