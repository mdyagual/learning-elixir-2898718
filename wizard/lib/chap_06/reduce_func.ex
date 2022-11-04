defmodule Wizard.Reduce do
  @moduledoc """
  This module contains functions for reducers.
  """

  def example1() do
    numbers = [2, 3, 4]
    IO.inspect(numbers, label: "Numbers")

    #collection, initial accumulator, function that took elems of the collection  and then the acc and well... you decide more ahead what to do. In this case, multiplicate
    #If initial accumulator is 0, technically this a sum() of list elements 
    r = Enum.reduce(numbers, 0, fn(n, acc) -> 
      IO.inspect(acc, label: "Accumulator")
      IO.inspect(n, label: "Element")
      IO.inspect(n + acc, label: "Product")
    end)
    IO.inspect(r, label: "Reduce")
  end

  def example2() do
    elements=["Carbon","Hydrogen","Iron"]
    IO.inspect(elements, label: "Elements")
  
    #r = Enum.reduce(elements,"",fn(elem,acc) ->
    #    IO.inspect(acc, label: "Accumulator")
    #    IO.inspect(elem, label: "Element")
    #    IO.inspect(acc <> elem, label: "Product")
    #    end)

    r2 = Enum.reduce(elements,[],fn(elem,acc) ->
        IO.inspect(acc, label: "Accumulator")
        IO.inspect(elem, label: "Element")
        IO.inspect([String.downcase(elem) | acc], label: "Product")
        end)    
    IO.inspect(r2, label: "Result")
  end

  def example3() do
   elements= [
        %{name: "Hydrogen", number: 1, weight: 1},
        %{name: "Carbon", number: 6, weight: 12},
        %{name: "Iridium", number: 77, weight: 192}
    ]

    #Calculate neutrons
    r3 = Enum.reduce(elements, [], fn(elem,acc) ->
        IO.inspect(acc, label: "Accumulator")
        IO.inspect(elem, label: "Element")
        neutrons = elem.weight - elem.number
        IO.inspect(neutrons, label: "Neutrons of "<>elem.name)
        IO.inspect([Map.put(elem, :neutrons, neutrons) | acc], label: "Product")
    end)
    IO.inspect(r3, label: "Result")
  end

#Classification
  def example4()do
    elements= [
        %{name: "Hydrogen", group: 1},
        %{name: "Carbon", group: 14},
        %{name: "Iridium", group: 9}
    ]

    IO.inspect(elements, label: "Elements")

    Enum.reduce(elements, [], fn
        %{group: 9} = elem, acc -> 
            class = classify(elem, "Transition metal")
            [class | acc]
        %{group: 14} = elem,acc ->
            class = classify(elem, "other non-metal")
            [class | acc]    
        _ = elem, acc ->
            class = classify(elem, "Unknown")
            [class | acc]    
    end)

  end

  def classify(map, classification) do
    Map.put(map, :classification,classification)
  end
     
end