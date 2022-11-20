defmodule Wizard.Ahorcado do
  def seleccion() do
    #palabras = ["mesa", "casa", "mariposa", "lapiz", "vaso", "cafetera"]
    palabras = ["cafetera"]
    Enum.random(palabras)
  end

  def init_juego() do
    selPal = seleccion()
    espacios = String.duplicate("_", String.length(selPal)-2)
    pal_j = String.first(selPal) <> espacios <> String.last(selPal)
    oport = 0
    juego(pal_j, selPal, oport, actualizarDibujo(0))


  end

  def juego(palJ, selPal, oport, dib_j) do
    IO.puts(dib_j)
    IO.puts(palJ)
    if palJ == selPal do
      juego(palJ)
    else
      ingL = IO.gets("Ingrese una letra: ") |> String.trim()
      if String.contains?(selPal, ingL) do
        pal_j = actualizarPalabra(palJ, ingL, selPal)
        juego(pal_j, selPal, oport, dib_j)
      else
        oport = oport + 1
        dib_j = actualizarDibujo(oport, dib_j)
        if is_atom(dib_j), do: dib_j, else: juego(palJ, selPal, oport, dib_j)
      end
    end
  end

  def juego(palAd), do: {:guessed, palAd}

  def juego(oport, _) when oport == 6, do: :gameover

  def actualizarPalabra(palJ, ingL, selPal) do
      mod = modificaciones(selPal, ingL)
      actualizar(mod, length(mod), palJ)
  end

  def modificaciones(selPal, ingL) do
    l_selPal = String.codepoints(selPal)
    Enum.filter(Enum.with_index(l_selPal), fn(t) -> elem(t, 0) == ingL end)
  end

  def actualizar(l_mods, tot, palJ) when tot > 0 do
    t = Enum.at(l_mods, length(l_mods)-tot)
    act = String.codepoints(palJ)
        |> List.replace_at(elem(t,1), elem(t,0))
        |> Enum.join("")
    tot = tot - 1
    actualizar(l_mods, tot, act)
  end

  def actualizar(_, 0, act), do: act

  def actualizarDibujo(oport, dib_j \\ "") do
    partes = ["O", "|", "/", "\\", "/", "\\"]
    dibujo = """
      ____
     |    |
     1    |
    324   |
    5 6   |
         _|_

    """
    dibujoComp = """
      ____
     |    |
     O    |
    /|\\   |
    / \\   |
         _|_

    """
    if oport == 0 do
      dibujo
    else
      if oport == 6 do
        IO.puts(dibujoComp)
        juego(oport, dibujoComp)
      else
        String.replace(dib_j, to_string(oport), Enum.at(partes, oport - 1))
      end


    end
  end

end

IO.inspect(Wizard.Ahorcado.init_juego)
