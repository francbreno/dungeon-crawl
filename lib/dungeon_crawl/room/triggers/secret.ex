defmodule DungeonCrawl.Room.Triggers.Secret do
  @behaviour DungeonCrawl.Room.Trigger
  alias DungeonCrawl.Chest
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell 

  def run(character, %Action{id: :forward}), do: {character, :forward}
  def run(character, %Action{id: :open}) do
      updated_char = Enum.random(Chest.all)
      |> open()
      |> take_effect(character)

      {updated_char, :forward}
  end

  defp open(chest) do
    Shell.info(chest.description)
    chest
  end

  defp take_effect(%Chest{type: :damage, points: damage_points}, character) do
    Shell.info("You received #{damage_points} damage points.")
    Character.take_damage(character, damage_points)
  end
  defp take_effect(%Chest{type: :healing, points: healing_points}, character) do
    Shell.info("You restored #{healing_points} points of health.")
    Character.heal(character, healing_points)
  end
  defp take_effect(%Chest{type: :gamepoints, points: gamepoints_points }, character) do
    character
  end
end