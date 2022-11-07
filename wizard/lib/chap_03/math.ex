defmodule Wizard.Math do
  @doc """
  The aritmethic and comparison operators

  """
  def demo do
    #add
    IO.puts("10 + 2 = #{10+2}")
    IO.puts("10.75 + 3.25 = #{10.75+3.25}")

    #substract right from left
    IO.puts("10 -2 = #{10-2}")
    IO.puts("10.75 - 3.25 = #{10.75-3.25}")

    #multiply
    IO.puts("10.75 * 3.25 = #{10.75*3.25}")

    #Divide left by right and return float
    IO.puts("10 / 2 = #{10/2}")

    #Divide left by right and return integer
    IO.puts("div(10/3) = #{div(10,3)}")

    #Remainder
    IO.puts("rem(10,3) = #{rem(10,3)}")

  end
end
