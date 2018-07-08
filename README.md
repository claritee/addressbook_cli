# AddressBook

Example Elixir application that

* Parses a CSV file
* Run an application as a CLI app
* Accepts command line args and responds accordingly

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `address_book` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:address_book, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/address_book](https://hexdocs.pm/address_book).


## Usage

```
mix deps.get

mix escript.build

./address_book --file people.csv --find total
./address_book --file people.csv --find oldest
./address_book --file people.csv --find name --city Melbourne
./address_book --file people.csv --find city --name Tom
```

## CSV Reader

This uses CSV

* `https://github.com/beatrichartz/csv`
* `https://hexdocs.pm/csv/CSV.html`

However there is another lib written that could be used (Nimble CSV) - `https://github.com/plataformatec/nimble_csv`

## Notes

Notes while working things out

Lambda

```
results ="people.csv" |> Path.expand(__DIR__) |> File.stream! |> CSV.decode |> Enum.map(fn(x) -> elem(x, 1) end)
[["Judy", "20", "Sydney"], ["Amy", "43", "Melbourne"], ["Mark", "23", "London"],
 ["Tom", "71", "Paris"], ["Lily", "65", "Berlin"]]


results ="people.csv" |> Path.expand(__DIR__) |> File.stream! |> CSV.decode |> Enum.map(&(elem(&1, 1)))
[["Judy", "20", "Sydney"], ["Amy", "43", "Melbourne"], ["Mark", "23", "London"],
 ["Tom", "71", "Paris"], ["Lily", "65", "Berlin"]]
 ```

 Sorting an Enum of Maps

 ```
 iex(11)> a = [%{name: 'c', val: 3}, %{name: 'a', val: 1}, %{name: 'z', val: 26}]
[%{name: 'c', val: 3}, %{name: 'a', val: 1}, %{name: 'z', val: 26}]
iex(12)> Enum.sort_by(a, fn(x) -> Map.get(x, :val)  end)
[%{name: 'a', val: 1}, %{name: 'c', val: 3}, %{name: 'z', val: 26}]
```

Calculating the oldest:

An alternative could be looping through the Enum, and comparing with the current largest number "oldest", updating the temporary variable that is "oldest"