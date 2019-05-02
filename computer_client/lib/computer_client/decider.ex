defmodule ComputerClient.Decider do
  
  alias TextClient.State
  def accept_move(game = %State{}) do
  
    guess = "abcdefghijklmnopqrstuvwxyz"
    |> String.codepoints
    |> Enum.random

    IO.puts("Computer choosing... " <>  guess <> "!!")
    IO.gets("Go?\n--------")
    Map.put(game, :guess, guess)
  end

end