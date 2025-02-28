defmodule ExMon.Game.Status do

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n===== The game is started =====\n")
    IO.inspect(info)
    IO.puts("------------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== It's #{player} turn =====\n")
    IO.inspect(info)
    IO.puts("------------------------------------")
  end

  def print_round_message(%{status: :game_over, turn: player} = info) do
    IO.puts("\n===== THE #{String.upcase(Atom.to_string(player))} WIN'S =====\n")
    IO.inspect(info)
    IO.puts("------------------------------------")
  end

  def print_error_message(move) do
    IO.puts("\n===== Invalid move: #{move} =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n===== The player attacked the computer dealing #{damage} damage =====\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n===== The computer attacked the player dealing #{damage} damage =====\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n===== The #{player} healled itself to #{life} life points =====\n")
  end

  def print_game_over_message(player, :game_over) do
    IO.puts("\n===== THE GAME IT'S OVER =====\n")
  end
end
