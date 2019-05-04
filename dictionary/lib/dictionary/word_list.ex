defmodule Dictionary.WordList do
  
  @word_list_file_name "assets/words.txt"

  @name __MODULE__

  def start_link() do
    Agent.start_link(&word_list/0, name: @name)
  end

  def random_word() do
    Agent.get(@name, &Enum.random/1)
  end

  def word_list() do
    @word_list_file_name
    |> Path.expand(__DIR__ <> "/../..")
    |> File.read!()
    |> String.split("\n")
  end

  def words_of_length(word_list, len) do
    word_list
    |> Stream.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) == len))
  end
end