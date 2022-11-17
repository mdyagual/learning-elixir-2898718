defmodule Wizard.Challenge.Processor do
  #Base para abrir los archivos
  def nom_nom(input_file_path, output_file_path) do
    input_file = File.open!(input_file_path, [:read, :utf8])
    output_file = File.open!(output_file_path, [:write, :utf8])

    add_nom_nom(input_file, output_file)

    File.close(input_file)
    File.close(output_file)
  end

  #Caso 1: Definición base para hacer uso de recursión
  defp add_nom_nom(food_file, output_file) do
    info = read_next_food(food_file)

    add_nom_nom(food_file, output_file, info)

  end

  #Case 3: Definición para detener la recursión, aprovechando que info puede llegar a ser nil de acuerdo a lo definido anteriormente
  defp add_nom_nom(_, _, nil), do: :ok

  #Caso 2: Definición para recursion e ir linea por línea en vez de iteración
  defp add_nom_nom(food_file, output_file, info) do

    food = Enum.at(info, 0)
    category = Enum.at(info, 1)

    noms = categorize(category)


    write_food(food, noms,output_file)

    info = read_next_food(food_file)

    add_nom_nom(food_file, output_file, info)

  end

  #Leyendo el archivo - cuando todo está bien
  defp read_next_food(file) do
    file
    |> IO.read(:line)
    |> process_text()
  end

  #Escribiendo en el archivo - cuando ya llega a eof
  defp write_food(nil, _, _), do: :ok

  #Escribiendo en el archivo - cuando todo está ok
  defp write_food(food, nom_text, output_file) do
    IO.write(output_file, food <> " ")
    IO.write(output_file, String.trim(nom_text) <> "\n")
  end



  defp categorize(category) do
    #IO.inspect(category)
    case category do
      category when category == "carne" -> String.duplicate("nom ", 8)
      category when category == "fruta" -> String.duplicate("nom ", 5)
      category when category == "verdura" or category == "hortaliza" -> String.duplicate("nom ", 6)
      category when category == "granos" -> String.duplicate("nom ", 4)
      _ -> String.duplicate("nom ", 3)
    end
  end

  #Procesando lo que se está leyendo - cuando ya llega a :eof
  defp process_text(:eof) do
    nil
  end

  #Procesando lo que se está leyendo - cuando es coherente
  defp process_text(line) do
    no_newline = String.replace(line, "\n", "")
    String.split(no_newline, "|")
  end



end
