defmodule Hangman.Server do

  alias Hangman.Game

  use GenServer
  # predefining a bunch of default callbacks
  # in Erlang, you must write 9 separate functions to get this to compile
  # in elixir, you only need two, and you can add the rest as you need them

  # start_link runs in the client code
  def start_link() do
    Hangman.Counter.increment()
    IO.inspect(Hangman.Counter.value(), label: "Num clients")
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    IO.inspect(label: "Starting server (init)")
    { :ok, Game.new_game() }
  end

  def handle_call({ :make_move, guess }, _from, game) do
    {game, tally} = Game.make_move(game, guess)
    { :reply, tally, game }
  end

  def handle_call({ :tally }, _from, game) do
    { :reply, Game.tally(game), game }
  end
end
