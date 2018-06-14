defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands
  import DungeonCrawl.FindOne

  def start(room) do
    room_actions = room.actions

    Shell.info(room.description())

    chosen_action = select_action(room_actions)
    {room, chosen_action}
  end

  defp select_action([]) do
    Shell.prompt("continue")
    :forward
  end
  defp select_action(actions) do
    chosen_action = 
      actions
      |> display_options            # show the options ot the user
      |> generate_question          # ask user for an option
      |> Shell.prompt               # waiting user input
      |> parse_answer               # parse the user answer
      |> find_one_by_index(actions) # search for an action with the user answer
  end
end