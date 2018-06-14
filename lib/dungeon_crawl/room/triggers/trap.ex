defmodule DungeonCrawl.Room.Triggers.Trap do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias DungeonCrawl.TrapDevice
  alias Mix.Shell.IO, as: Shell

  def run(character, _) do
    updated_char = Enum.random(TrapDevice.all)
    |> execute()
    |> take_effect(character)

    {updated_char, :forward}
  end

  defp execute(trap) do
    Shell.info("#{trap.name}: #{trap.description}")
    trap
  end

  defp take_effect(%TrapDevice{points: damage_points}, character) do
    Shell.info("You received #{damage_points} damage points.")
    Character.take_damage(character, damage_points)
  end
end