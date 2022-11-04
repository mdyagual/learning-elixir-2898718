defmodule Wizard.Control do
  #Typical if-else
  def example1(value) do
    if value do
      true
    else
      false
    end

  end

  #More functional if-else
  def example2(value) do
    if value, do: true, else: false
  end

  @doc """
  Arguments for example 3
  e = %{name: "Hydrogen", group: 1}
  e = %{name: "Carbon", group: 14}
  e = %{name: "Iridium", group: 9}
  e = %{name: "Calcium", group: 2}
  """

  def example3(%{name: name, group: group}) do
    if (name === "Hydrogen" and group ===1)
    or group == 14 do
      "Other non metal"
    else
      if group === 9 do
        "Transitional metal"
      else
        "Unknown"
      end
    end
  end

  def example3(_), do: "Unknowm"



end
