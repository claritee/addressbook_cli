defmodule AddressBook.CLI do
  @moduledoc """
  Elixir CLI app that reads a file and returns details
  """

  @doc """
  TODO

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
    people = opts[:file]
    |> Path.expand("#{__DIR__}/../")
    |> File.stream!
    |> CSV.decode
    |> Enum.map(&(to_person(&1)))
    [first | list] = people
    Map.get(first, :name)
  end

  defp to_person(person_tuple) do
    person = elem(person_tuple, 1)
    [name, age, city] = person
    %{name: name, age: age, city: city}
  end
end
