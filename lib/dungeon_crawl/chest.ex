defmodule DungeonCrawl.Chest do
  alias DungeonCrawl.Chest
  defstruct type: nil, description: nil, points: 0

  def all, do: [
    %Chest{
      type: :damage,
      description: "A dart is throwed",
      points: 1
    },
    %Chest{
      type: :damage,
      description: "A poisoned snake jumps to bite you",
      points: 3
    },
    %Chest{
      type: :damage,
      description: "Some king of powder is throwed. your eyes starts burning",
      points: 2
    },
    %Chest{
      type: :healing,
      description: "A magic potion to restore a small bit of health",
      points: 1
    },
    %Chest{
      type: :healing,
      description: "An old elixir to restore a large amount of health",
      points: 8
    },
    %Chest{
      type: :gamepoints,
      description: "You earned some points",
      points: 3
    },
  ]
end