defmodule Wizard.Blackjack do
  def palos() do
    [%{
        classification: "heart",
        cards: cartas()
      },
      %{
        classification: "diamond",

        cards: cartas()
      },
      %{
        classification: "ace",

        cards: cartas()
      },
      %{
        classification: "clover",

        cards: cartas()
      }

    ]
  end

  def cartas() do
    [
      {"A", "?"},{"1", 1},
      {"2", 2},{"3", 3},
      {"4", 4},{"5", 5},
      {"6", 6},{"7", 7},
      {"8", 8},{"9", 9},
      {"10", 10},{"K", 10},
      {"J", 10},{"Q", 10},
    ]
  end

  def sel_carta() do
    palo_sel = Enum.random(palos())
    carta = Map.get(palo_sel, :cards) |> Enum.random()
    %{symbol: Map.get(palo_sel, :classification),
      card: carta}
  end

  def init() do
    j1 = [sel_carta()] #4 corazon
    cpu = [sel_carta()] #K trebol
    ronda = 1
    punt_j1 = actualizarPuntaje(j1, 0)
    punt_cpu = actualizarPuntaje(cpu, 0)

    juego(j1, punt_j1, cpu, punt_cpu, ronda, "")
  end

  def juego(j1, punt_j1, cpu, punt_cpu, ronda, cont) when (punt_j1 < 21 and punt_cpu < 21) and cont != "N" do
    #Mostrar número de ronda
    IO.puts("Ronda #{ronda}")

    #Mostrar cartas del J1
    IO.inspect(j1, label: "Jugador")
    IO.puts("Puntaje: #{punt_j1}")
    #Mostrar cartas de la CPU
    IO.inspect(cpu, label: "CPU")
    IO.puts("Puntaje: #{punt_cpu}")


    #Preguntar si quiere robar carta
    ing = IO.gets("Robar carta? S/N: ") |> String.trim() |> String.upcase()

    #Si se roba actualizar la lista de las cartas
    ronda = ronda + 1
    j1 = actualizarCartas(j1, cpu, ronda, ing)
    cpu = actualizarCartas(cpu, j1, ronda, ing)

    #Actualizar el puntaje
    punt_j1 = actualizarPuntaje(j1, punt_j1)
    punt_cpu = actualizarPuntaje(cpu, punt_cpu)

    IO.puts(String.duplicate("-",100))

    juego(j1, punt_j1, cpu, punt_cpu, ronda, ing)

  end

  def juego(j1, punt_j1, cpu, punt_cpu, _, _) when(is_atom(j1) or is_atom(cpu)) do

    cond do
      punt_j1 < punt_cpu   || punt_cpu == 21  -> :winner_cpu
      punt_cpu < punt_j1   || punt_j1 == 21 -> :winner_j1
      punt_j1 == punt_cpu-> :tie
      true -> :nowinner

    end
  end

  def juego(j1, punt_j1, cpu, punt_cpu, _, _) do
    #Mostrar número de ronda
    IO.puts("Resultado final")

    #Mostrar cartas del J1
    IO.inspect(j1, label: "Jugador")
    IO.puts("Puntaje: #{punt_j1}")
    #Mostrar cartas de la CPU
    IO.inspect(cpu, label: "CPU")
    IO.puts("Puntaje: #{punt_cpu}")

    cond do
      (punt_j1 < punt_cpu  && punt_cpu < 21) || punt_cpu <= 21  -> :winner_cpu
      (punt_cpu < punt_j1 && punt_j1 < 21)  || punt_j1 <= 21  -> :winner_j1
      punt_j1 === punt_cpu-> :tie
      true -> :nowinner

    end
  end

  def actualizarCartas(l_act, l_opon, ronda, "S") when length(l_act) <= ronda do
    carta_nueva = sel_carta()
    cond do
      !Enum.any?(l_act, fn elem -> elem == carta_nueva end) && !Enum.any?(l_opon, fn elem -> elem == carta_nueva end)  -> [ carta_nueva | l_act ] |> Enum.reverse()
      true -> actualizarCartas(l_act, l_opon, ronda, "S")
    end
  end

  def actualizarCartas(_, _, _, "N"), do: :nodraw

  def actualizarPuntaje(:nodraw, punt_act), do: punt_act

  def actualizarPuntaje(l_cartas, punt_act) do
    val = List.last(l_cartas) |> Map.get(:card) |> elem(1)
    cond do
      val == "?" && punt_act>=10 -> punt_act + 1
      val == "?" && punt_act<10 -> punt_act + 11
      true -> punt_act + val
    end

  end

end
