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
    IO.puts(args)
  end
end
