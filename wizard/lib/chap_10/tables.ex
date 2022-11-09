defmodule Wizard.Tables do
  #table = :ets.new(:user_lookup, [:set, :protected])
  #IO.inspect(table, label: "Created table")

  table2 = :ets.new(:user_lookup, [:set, :protected, :named_table])
  IO.inspect(table2, label: "Created table with name")

  :ets.insert(:user_lookup, {"doomspork", "Sean", ["Elixir", "Ruby", "Java"]})

  :ets.insert_new(:user_lookup, {"3100", "", ["Elixir", "Ruby", "JavaScript"]})

  #:ets.insert_new(:user_lookup, {"doomspork", "Sean", ["Elixir", "Ruby", "Java"]}) #devuelve falso si la clave ya existe

  doomspork = :ets.lookup(:user_lookup, "doomspork")

  #IO.inspect(doomspork)

  IO.inspect(:ets.match(:user_lookup, {:"$3", :"$2", :"$1"}))

end
