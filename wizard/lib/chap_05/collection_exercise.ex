defmodule Wizard.CollectionExercise do
  @moduledoc """
  This module contains several exercises. Use what you have 
  learned about lists and maps to complete the incomplete
  functions.
  """

  @doc """
  Write a function takes a list and prints out the first 
  element of that list.
  """
  def first(list) do
    List.first(list)
  end

  @doc """
  Write a function takes a list and prints out the last 
  element of that list.
  """
  def last(list) do
    List.last(list)
  end

  @doc """
  Return the list with "Carbon" removed from the list.
  """
  def remove() do
    elements = ["Carbon", "Hydrogen", "Ruthenium", "Silicon"]
    List.delete(elements, "Carbon")
  end

  @doc """
  Combine the two lists. 
  """
  def combine() do
    ["Carbon", "Hydrogen"]++["Tin", "Lead"]

  end

  @doc """
  Wanda wants to organize the books in her laboratory. 
  Create a list of maps to represent her books in the list 
  below.
  
  Each map should have keys for title, author, and year.
  The keys should be atoms.
  
  * A Wizard Compendium, by Vesuvi Monmount, 1968
  * Spells for All Seasons, by Helen Troy, 1488
  * The House of Herbs, by Nikola Wynne, 1856
  * Cabbage and Casting, by Cilka Parfait, 1975
  """
  def books() do
    book1 = %{title: "A Wizard Compendium", author: "Vesuvi Monmount", year: 1968 }
    book2 = %{title: "Spells for All Seasons", author: "Helen Troy", year: 1488 }
    book3 = %{title: "The House of Herbs", author: "Nikola Wynne", year: 1856 }
    book4 = %{title: "Cabbage and Casting", author: "Cilka Parfait", year: 1975 }

    [book1,book2,book3,book4]
  end

  @doc """
  Write a function to take the list of books, select the 
  first map from the list, and return a list of its keys.
  Challenge: can you make use of the functions you've 
  already written?
  """
  def book_keys(_) do
    Map.keys(first(books()))

  end


  @doc """
  Run this function to test  your solutions. 
  """
  def test() do
    IO.puts first([1, 2, 3]) == 1
    IO.puts last([1, 2, 3]) == 3
    IO.puts remove() == ["Hydrogen", "Ruthenium", "Silicon"]
    IO.puts combine() == ["Carbon", "Hydrogen", "Tin", "Lead"]
    IO.puts Enum.all?(books(), fn b -> 
        Map.has_key?(b, :title) 
        && Map.has_key?(b, :author)
        && Map.has_key?(b, :year) 
    end)
    IO.puts book_keys(books()) === [:author, :title, :year]
  end
end