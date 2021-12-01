defmodule Day01.Utils.FileReader do
  def read_file_numeric(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim(&1, "\n"))
    |> Stream.map(&String.split(&1, "\n"))
    |> Stream.concat()
    |> Enum.to_list()
    |> Enum.map(fn number ->
      {number, _rest} = Integer.parse(number)
      number
    end)
  end
end
