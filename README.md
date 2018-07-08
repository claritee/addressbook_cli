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


## To run

```
mix deps.get

mix escript.build

./address_book --file people.csv
```

## CSV Reader

This uses CSV

* `https://github.com/beatrichartz/csv`
* `https://hexdocs.pm/csv/CSV.html`

However there is another lib written that could be used (Nimble CSV) - `https://github.com/plataformatec/nimble_csv`

## Notes

```
results ="people.csv" |> Path.expand(__DIR__) |> File.stream! |> CSV.decode |> Enum.map(fn(x) -> elem(x, 1) end)
[["Judy", "20", "Sydney"], ["Amy", "43", "Melbourne"], ["Mark", "23", "London"],
 ["Tom", "71", "Paris"], ["Lily", "65", "Berlin"]]

 
results ="people.csv" |> Path.expand(__DIR__) |> File.stream! |> CSV.decode |> Enum.map(&(elem(&1, 1)))
[["Judy", "20", "Sydney"], ["Amy", "43", "Melbourne"], ["Mark", "23", "London"],
 ["Tom", "71", "Paris"], ["Lily", "65", "Berlin"]]
 ```