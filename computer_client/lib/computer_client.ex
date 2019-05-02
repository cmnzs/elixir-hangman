defmodule ComputerClient do

  defdelegate start(), to: ComputerClient.Interact
end
