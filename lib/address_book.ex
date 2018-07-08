defmodule AddressBook.CLI do
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
    args
    |> parse_args
    |> response
    |> IO.puts()
  end

  defp parse_args(args) do
    {opts, _word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean])
    opts
  end

  defp response(opts) do
    # IO.inspect(opts) #[file: "people.csv", find: "oldest"]
    people = 
      opts[:file]
      |> Path.expand("#{__DIR__}/../")
      |> File.stream!
      |> CSV.decode
      |> Enum.map(&(to_person(&1)))
      |> response(opts)
  end

  defp response(people, [file: _file, find: "total"]) do
    people |> Enum.count
  end

  defp response(people, [file: _file, find: "oldest"]) do
    people
    |> Enum.sort_by(&Map.get(&1, :age))
    |> List.last
    |> Map.get(:name)
  end

  defp response(people, [file: _file, find: "name", city: city]) do
    ""
  end

  defp response(people, [file: _file, find: "city", name: name]) do
    "city"
  end

  defp to_person(person_tuple) do
    [name, age, city] = elem(person_tuple, 1)
    %{name: name, age: String.to_integer(age), city: city}
  end
end
