defmodule Wizard.Cond do
  @moduledoc """
  Cond structure
  """

  @doc """
  Values to try:
  Wizard.Cond.example("iridium")
  Wizard.Cond.example("Iridium")
  Wizard.Cond.example("CARBON")
  Wizard.Cond.example("hydrogen")
  Wizard.Cond.example("radium")
  """

  def example(element) do
    element = String.downcase(element)
    cond do
      element === "iridium" -> 77
      element === "carbon" -> 6
      element === "Hydrogen" -> 1
      true -> nil
    end
  end

end
