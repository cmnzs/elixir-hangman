defmodule ComputerClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :computer_client,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      hangman: [ path: "../hangman"],
      text_client: [ path: "../text_client"],
    ]
  end
end
