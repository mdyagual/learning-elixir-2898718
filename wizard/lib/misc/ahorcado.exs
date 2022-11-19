defmodule Wizard.Ahorcado do
  def seleccion() do
    palabras = ["mesa", "casa", "mariposa", "lapiz", "vaso", "cafetera"]
    Enum.random(palabras)
  end

  def init_juego() do
    selPal = seleccion()
    espacios = String.duplicate("_", String.length(selPal)-2)
    pal_j = String.first(selPal) <> espacios <> String.last(selPal)
    juego(pal_j, selPal)
  end

  def juego(palJ, selPal) do
    IO.puts(palJ)
    pal_ad = IO.gets("Ingrese una letra: ") |> String.trim()
    pal_j = actualizar(palJ, pal_ad, selPal)
    if pal_j == selPal, do: {:guessed, selPal}, else: juego(pal_j, selPal)
  end



  def actualizar(palJ, ingL, selPal) do
    if String.contains?(selPal, ingL) do
      l_palJ = String.codepoints(palJ)
      l_selPal = String.codepoints(selPal)
      getPos = Enum.filter(Enum.with_index(l_selPal), fn(t) -> elem(t, 0) == ingL end)
      r = Enum.at(Enum.map(getPos, fn t -> List.replace_at(l_palJ, elem(t,1),ingL) end), 0) #Mejorar
      #IO.inspect(r)
      Enum.join(r, "")
    end


  end



end

IO.inspect(Wizard.Ahorcado.init_juego)
