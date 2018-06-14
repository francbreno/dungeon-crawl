defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands
  import DungeonCrawl.FindOne 

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_one_by_index(heroes)
    |> ask_for_confirmation
    |> confirm
  end

  defp ask_for_confirmation(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    answer = Shell.yes?("confirm")
    {answer, chosen_hero}
  end

  defp confirm({ true, chosen_hero }), do: chosen_hero
  defp confirm(_), do: start()
end