defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do: [
    # %Room {
    #   description: "You can see the light of day. You found the exit!",
    #   actions: [forward()],
    #   trigger: Triggers.Exit
    # },
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [fight(), forward()],
      trigger: Triggers.Enemy
    },
    %Room{
      description: "There's a secret chest in the room. You can open it, but caution. Every secret has a price",
      actions: [open(), forward()],
      trigger: Triggers.Secret
    },
    %Room{
      description: "It's a trap!!!",
      actions: [],
      trigger: Triggers.Trap
    },
  ]
end