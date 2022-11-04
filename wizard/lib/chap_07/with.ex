defmodule Wizard.With do
  @doc """
  Try these values:
  e = %{name: "Iron", group: 8}
  e = %{name: "Carbon", group: 8}

  Wizard.With.example(%{name: "Carbon", group: 8})
  """
  def example(e) do
    with "Iron" <- Map.get(e,:name),
      8 <- Map.get(e, :group) do
        :ok
      end
  end
end
