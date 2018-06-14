defmodule DungeonCrawl.TrapDevice do
  alias DungeonCrawl.TrapDevice
  defstruct name: nil, description: nil, points: 0

  def all(), do: [
    %TrapDevice {
      name: 'Bear Trap',
      description: 'An item used to immobilize larger creatures',
      points: 3
    },
    %TrapDevice {
      name: 'Freezing room',
      description: 'A room of freezing particles that stick to the skin',
      points: 2
    },
    %TrapDevice {
      name: 'Nightmares Room',
      description: "A room full of bubbles that show the players' nightmares, bad memories and fears",
      points: 1
    },
  ]
end