defmodule TextClient.Summary do
  def display(game = %{tally: tally}) do
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")}\n",
      "guesses Left: #{tally.turns_left}\n",
      "Letters used: #{tally.letters_used}\n"
    ]
    game
  end
end