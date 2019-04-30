defmodule Dictionary do
  @word_list_file_name "assets/words.txt"

  @spec random_word() :: binary
  def random_word do
    word_list()
    |> Enum.random
    |> String.trim
  end

  @spec words_of_length(integer)  :: [ binary ]
  def words_of_length(len) do
    word_list()
    |> Stream.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) == len))
  end

  defp word_list do
    @word_list_file_name
    |> Path.expand(__DIR__ <> "/..")
    |> File.open!
    |> IO.stream(:line)
  end

  ## random funcs from the coding gnome dash through types

  # def even_length?([]), do: true
  # def even_length?([_h]), do: false
  # def even_length?([_h1,_h2 | t]), do: even_length?(t)

  # def sum_pairs([]), do: []
  # def sum_pairs([ h1, h2 | t]), do: [ h1 + h2 | sum_pairs(t) ]

end
