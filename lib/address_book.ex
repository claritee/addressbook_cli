defmodule AddressBook do
  @moduledoc """
  Elixir CLI app that reads a file and returns details
  """

  @doc """
  Parse a CSV of people and find information
  $ ./address_book --file people.csv --find oldest
  $ ./address_book --file people.csv --find city --name Lily
  $ ./address_book --file people.csv --find name --city Melbourne
  $ ./address_book --file people.csv --find total
  """
  def main(args \\ []) do
    result =
      args
      |> parse_args
      |> response
    IO.inspect(result)
    result
  end

  defp parse_args(args) do
    {opts, _word, _} = OptionParser.parse(args, switches: [upcase: :boolean])
    opts
  end

  defp response(opts) do
    opts[:file]
    |> Path.expand("#{__DIR__}/../")
    |> File.stream!
    |> CSV.decode
    |> Enum.map(fn(item) -> to_person(item) end)
    |> response_do(opts)
  end

  defp response_do(result, [file: _, find: "total"]) do
    Enum.count(result)
  end

  defp response_do(result, [file: _, find: "oldest"]) do
    result
    |> Enum.sort_by(&Map.get(&1, :age))
    |> List.last
    |> Map.get(:name)
  end

  defp response_do(result, [file: _, find: "name", city: city]) do
    result
    |> Enum.find(fn person -> person.city == city end)
    |> Map.get(:name)
  end

  defp response_do(result, [file: _, find: "city", name: name]) do
    result
    |> Enum.find(fn person -> person.name == name end)
    |> Map.get(:city)
  end

  defp response_do(_result, _find, _name, _city), do: nil

  defp to_person(person_tuple) do
    [name, age, city] = elem(person_tuple, 1)
    %{name: name, age: String.to_integer(age), city: city}
  end
end
