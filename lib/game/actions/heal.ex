defmodule ExMon.Game.Actions.Heal do
  alias ExMon.Game.Status
  alias ExMon.Game

  @heal_power 18..25

  def heal_life(player) do
    player
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life()
    |> set_life(player)
  end

  defp calculate_total_life(life), do: life + Enum.random(@heal_power)

  defp set_life(life, player) when life > 100, do: update_player_life(100, player)
  defp set_life(life, player), do: update_player_life(life, player)

  defp update_player_life(life, player) do
    player
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(player, life)
  end

  defp update_game(player_data, player, life) do
    Game.info()
    |> Map.put(player, player_data)
    |> Game.update()

    Status.print_move_message(player, :heal, life)
  end

end
