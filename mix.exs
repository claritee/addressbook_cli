defmodule AddressBook.Mixfile do
  use Mix.Project

  def project do
    [
      app: :address_book,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  defp escript do
    [main_module: AddressBook]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 2.1.1"}
    ]
  end
end
