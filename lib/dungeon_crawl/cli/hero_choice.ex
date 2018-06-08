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
    |> confirm_hero
  end

  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("confirm"), do: chosen_hero, else: start()
  end

end