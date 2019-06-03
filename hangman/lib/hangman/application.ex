defmodule Hangman.Application do
  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    children = [
      worker(Hangman.Server, []),
    ]

    options = [
      name: Hangman.Supervisor,
      strategy: :simple_one_for_one,
    ]
    spawn(Hangman.Counter, :start_link, [0])

    Supervisor.start_link(children, options)
  end
end

defmodule Hangman.Counter do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: :hangman_counter)
  end

  def value do
    Agent.get(:hangman_counter, & &1)
  end

  def increment do
    Agent.update(:hangman_counter, &(&1 + 1))
  end
end

