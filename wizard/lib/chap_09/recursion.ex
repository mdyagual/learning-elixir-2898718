defmodule Wizard.Recursion do
  @doc """
  Accept an integer. Add 1 to the integer and bind the result to the variable 'sum'
  Output 'sum' using IO.puts/2
  Send 'sum' to infinity/1 to repeat the process infinitely
  """
  #Infinite loop!
  def infinity(i) do
    sum = i+1
    IO.puts(sum)
    infinity(sum)
  end

  def add_one(i, counter) when is_integer(i)
  and is_integer(counter)
  and counter <= 1 do
    IO.puts(i+1)
  end

  def add_one(i, counter) when is_integer(i)
  and is_integer(counter) do
    sum = i + 1
    reduced_counter = counter - 1
    IO.puts(sum)
    add_one(sum,reduced_counter)
  end



end
