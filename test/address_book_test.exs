defmodule AddressBookTest do
  use ExUnit.Case
  doctest AddressBook

  test "find the total" do
    assert AddressBook.main(String.split("--file people.csv --find total")) == 5
  end

  test "find the oldest" do
    assert AddressBook.main(String.split("--file people.csv --find oldest")) == "Tom"
  end

  test "find the city that Lily lives in" do
    assert AddressBook.main(String.split("--file people.csv --find city --name Lily")) == "Berlin"
  end

  test "find who lives in Melbourne" do
    assert AddressBook.main(String.split("--file people.csv --find name --city Melbourne")) == "Amy"
  end
end
