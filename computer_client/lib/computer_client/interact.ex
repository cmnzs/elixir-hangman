defmodule ComputerClient.Interact do
  
  alias TextClient.State
  alias ComputerClient.ComputerPlayer

  def start() do
    Hangman.new_game()
    |> setup_state()
    |> ComputerPlayer.play()
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally:        Hangman.tally(game)
    }
  end

end