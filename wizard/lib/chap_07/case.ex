defmodule Wizard.Case do
  def example1() do
    elements = ["CARBON", "carbon", "neither"]
    element = Enum.random(elements) #To pick randomly an element

    case element do
      "CARBON" -> "UPCASE CARBON"
      "carbon" -> "downcase carbon"
      _ -> "Other"
    end
  end

  @doc """
  Try with these values:
  Wizard.Case.example2(3)
  Wizard.Case.example2("iron")
  Wizard.Case.example2(:ok)
  Wizard.Case.example2(%{name: "Hydrogen"})
  Wizard.Case.example2(true)
  """

  def example2(value) do
    case value do
      e when e == "wizaard" or e in [1, 2, 3] -> "Winner!"
      %{name: e} when e == "Hydrogen" -> "Hydrogen"
      e when is_binary(e) -> "Binary"
      e when is_integer(e) -> "Integer"
      e when is_atom(e) -> "Atom"
      e when is_map(e) -> "Map"
      e when is_nil(e) -> "Nil"
      _ -> "Other"
    end
  end



end
