defmodule Wizard.ElementChallenge do
  def heavy_metal(nil), do: :error
  def heavy_metal([]), do: :error

  def heavy_metal(elements) do
    if(has_keys?(List.first(elements))) do
      get_heaviest(elements)
    else
      :error
    end

  end

  def get_heaviest(elements) do
      sortedMap = Enum.sort_by(elements, fn(x) -> x.weight end, :desc)
      List.first(sortedMap)
  end

  def has_keys?(element) when is_map(element)do
    Map.has_key?(element, :name) and
    Map.has_key?(element, :number) and
    Map.has_key?(element, :weight)
  end


end
