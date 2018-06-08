defmodule DungeonCrawl.FindOne do
  def find_one_by_index(index, elements), do: Enum.at(elements, index)
end