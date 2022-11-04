defmodule Wizard.EnumChallenge do
    @moduledoc """
    This module contains a challenge for you. Use what you 
    have learned about iteration with enumerators to solve it.
    Your challenge is to complete the functions in this module.
    The `\` followed by `u` is an escape code for unicode 
    values in Elixir. You can read more about them in the 
    Elixir documentation sigils at 
    https://elixir-lang.org/getting-started/sigils.html 
    magic_of_three/0
    This function should take the list of unicode values and
      - sort it
      - return the first three elements
    magic_of_red/0
    This function should take the list of unicode values  and
      - only return the red x's
    magic_of_green/0
    This function should take the list of unicode values  and
      - use reduce/3 to only return the green check marks
    magic_of_reduce/0
    This function take the list of unicode values and
      - return a new, sorted list
      - where the red x's have been replaced with the greek symbol omega
      - and only contains green check marks and omegas (anything else should be removed)
    To test your code, run test/0.
    """

    @doc """
    Make enumerable magic!
    Sort the enumerable and return the first three elements
    "\u2705" - check
    "\u274c" - cross
    """
    def magic_of_three() do
      elements = ["\u2705", "\u274c", "\u2705", "\u2705", "\u274c", "\u2705", "\u2705"]
      e_sorted = Enum.sort(elements)
      Enum.take(e_sorted,3)


    end

    @doc """
    Make enumerable magic!
    Only return the red x's
    """
    def magic_of_red() do
      elements = ["\u2705", "\u274c", "\u2705", "\u2705", "\u274c", "\u2705", "\u2705"]
      Enum.filter(elements, fn(x) -> x=="\u274c" end)
    end

    @doc """
    Make enumerable magic!
    Only return the green check marks
    """
    def magic_of_green() do
      elements = ["\u2705", "\u274c", "\u2705", "\u2705", "\u274c", "\u2705", "\u2705"]
      Enum.filter(elements, fn(x) -> x=="\u2705" end)
    end

    @doc """
    Make enumerable magic!
    Create a new list where the red x's have been replaced 
    with the greek symbol omega. Return a sorted list only 
    containing green check marks and omegas.
    """
    def magic_of_reduce() do
      elements = ["\u2705", "\u274c", "\u2705", "\u2705", "omega", "\u274c", "\u2705", "\u2705"]
      result = Enum.reduce(elements, [], fn
        "\u274c" = elem, acc ->  acc ++ ["\u03A9"] 
        "\u2705"= elem, acc -> acc ++ ["\u2705"]
        _ = elem, acc -> acc
        end)

        Enum.sort(result)

    end

    @doc """
    Test your enumerable magic!
    Run this function to test all your solutions.
    """
    def test() do
        IO.puts magic_of_three() == ["✅", "✅", "✅"]
        IO.puts magic_of_red() == ["❌", "❌"]
        IO.puts magic_of_green() == ["✅", "✅", "✅", "✅", "✅"]
        IO.puts magic_of_reduce() == ["Ω", "Ω", "✅", "✅", "✅", "✅", "✅"]
    end
  end