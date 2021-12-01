defmodule Day01.Counter do
  def counter_mesaurence_part_1(path_input) do
    list_mesaurences = Day01.Utils.FileReader.read_file_numeric(path_input)
    count_mesaurence_increases(0, list_mesaurences, nil)
    |> IO.inspect()
  end

  def counter_mesaurnece_part_2(path_input) do
    list_mesaurences = Day01.Utils.FileReader.read_file_numeric(path_input)
    |> generate_list_mesaurence_list()
    count_mesaurence_increases(0, list_mesaurences, nil)
    |> IO.inspect()
  end

  def count_mesaurence_increases(0, [current_mesaurence | rest_mesaurences], nil) do
    count_mesaurence_increases(0, rest_mesaurences, current_mesaurence)
  end

  def count_mesaurence_increases(count, [current_mesaurence | rest_mesaurences], last_mesaurence) do
    count =
      case current_mesaurence > last_mesaurence do
        true ->
          count + 1

        false ->
          count
      end

    count_mesaurence_increases(count, rest_mesaurences, current_mesaurence)
  end

  def count_mesaurence_increases(count, [], _last_mesaurence) do
    count
  end

  @spec generate_list_mesaurence_list(nonempty_maybe_improper_list) :: any
  def generate_list_mesaurence_list(list_mesaurences) do
    list_mesaurences
    |> generate_groups_of_3([])
    |> Enum.reverse()
    |> Enum.map(fn list -> sum_group_mesaurences(list) end)
  end

  def generate_groups_of_3([current_mesaurence | rest_mesaurence], list) do
    case generate_group(current_mesaurence, rest_mesaurence, Enum.count(rest_mesaurence)) do
      :no_enounght_elements ->
        list

      list_of_3_mesaurence ->
        list = [list_of_3_mesaurence | list]
        generate_groups_of_3(rest_mesaurence, list)
    end
  end

  def generate_group(first_mesaurence, list_mesaurence, mesaurences_left)
      when mesaurences_left >= 2 do
    [first_mesaurence, Enum.at(list_mesaurence, 0), Enum.at(list_mesaurence, 1)]
  end

  def generate_group(_first_mesaurence, _list_mesaurence, _mesaurences_left) do
    :no_enounght_elements
  end

  def sum_group_mesaurences(list) do
    Enum.reduce(list, fn mesaurence, acc -> mesaurence + acc end)
  end
end
