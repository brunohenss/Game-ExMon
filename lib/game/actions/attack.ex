defmodule ExMon.Game.Actions.Attack do
  @move_rnd_power 10..35
  @move_avg_power 18..25

  def attack_opponent(opponent, move) do
    damage = calculate_power(move)
    
  end

  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)
  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  end
