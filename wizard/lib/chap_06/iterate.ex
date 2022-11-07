defmodule Wizard.Iterate do
  @moduledoc """
  Functions for interating using list comprehensions
  """

  def example1() do
    numbers = [1, 2, 3]
    IO.inspect(numbers, label: "Example 1 - Numbers")

    comp = for num <- numbers, do: num * 3
    IO.inspect(comp, label: "Multiply by 3")

  end

  def example2() do
    symbols = %{"Iron" => "Fe", "Carbon" => "C"}
    IO.inspect(symbols, label: "Example 2 - Symbols")

    keys = for {key, _value} <- symbols do
      key <> ", "
    end

    values = for {_key, value} <- symbols do
      value <> ", "
    end

    IO.puts("Keys and values by separate")
    IO.puts(keys)
    IO.puts(values)
  end

  def example3 do
    amounts = [2, 3]
    sizes = ["cups", "spoonfuls"]
    items = ["elderflower", "pomfrey"]

    joins = for a <- amounts, s <- sizes, i <- items do
      "#{a} #{s} of #{i}\n"
    end
    IO.puts(joins)
  end

  def example4 do
    #With letters will work the same
    i = [5, 4, 8, 1, 2]
    IO.inspect(i, label: "Example 4 - Enums")

    i_sorted = Enum.sort(i)
    i_sorted_desc = Enum.sort(i, :desc)

    IO.puts("Sorted list")
    IO.inspect(i_sorted)
    IO.puts("Sorted list inversed")
    IO.inspect(i_sorted_desc)
  end

  def example5 do
    animals = ["le chat", "le chien", "le lapin", "le perroquet"]
    IO.inspect(animals, label: "Animals in french")

    #Iterate and prints each animal (a) in animals
    e = Enum.each(animals, fn(a) -> IO.puts(a) end)
    IO.inspect(e, label: "Animals after Enum.each")

    m1 = Enum.map(animals, fn(a) -> IO.puts(a) end)
    IO.inspect(m1, label: "Animals after map - puts")

    m2 = Enum.map(animals, fn(a) -> IO.inspect(a) end)
    IO.inspect(m2, label: "Animals after map - inspect")
  end

  def example6 do
    elements = [%{name: "Hydrogen", symbol: "H", number: 1},
    %{name: "Iron", symbol: "Fe", number: 26},
    %{name: "Carbon", symbol: "C", number: 6}]

    #Sort by symbol, asc
    bySymbol = Enum.sort_by(elements, fn(e) -> e.symbol end)
    IO.puts("Sorted by symbol - asc")
    IO.inspect(bySymbol)
    #Sort by number desc
    byNumber = Enum.sort_by(elements, fn(e) -> e.number end, :desc)
    IO.puts("Sorted by number - desc")
    IO.inspect(byNumber)

  end

end
