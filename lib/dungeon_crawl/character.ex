defmodule DungeonCrawl.Character do
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil
  
  @type t :: %DungeonCrawl.Character{
    name: String.t,
    description: String.t,
    hit_points: non_neg_integer,
    max_hit_points: non_neg_integer,
    attack_description: String.t,
    damage_range: Range.t
  }

  defimpl String.Chars do
    def to_string(character), do: character.name
  end

  def take_damage(character, damage) do
    new_hitpoints = max(0, character.hit_points - damage)
    update_hitpoints(character, new_hitpoints)
  end

  def heal(character, healing_value) do
    new_hitpoints = min(
      character.hit_points + healing_value,
      character.max_hit_points
    )
    update_hitpoints(character, new_hitpoints)
  end

  defp update_hitpoints(character, updated_hitpoints) do
    %{character | hit_points: updated_hitpoints}
  end
end