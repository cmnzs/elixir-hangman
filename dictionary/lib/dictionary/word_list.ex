defmodule Dictionary.WordList do
  
  @word_list_file_name "assets/words.txt"

  def random_word(word_list) do
    word_list
    |> Enum.random
    |> String.trim
  end

  def words_of_length(word_list, len) do
    word_list
    |> Stream.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) == len))
  end

  def start() do
    @word_list_file_name
    |> Path.expand(__DIR__ <> "/../..")
    |> File.read!()
    |> String.split("\n")
  end

end