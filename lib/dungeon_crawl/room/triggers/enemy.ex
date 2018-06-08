defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Enemies
  alias DungeonCrawl.Battle
  alias Mix.Shell.IO, as: Shell 

  def run(character, %Action{id: :forward}), do: {character, :forward}
  def run(character, %Action{id: :fight}) do
    enemy = Enum.random(Enemies.all)

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You where prepared and attack first.")
    {updated_char, _enemy} = Battle.fight(character, enemy)

    {updated_char, :forward}
  end
end