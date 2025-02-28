defmodule ExMonTest do
  use ExUnit.Case
  alias ExMon.Player
  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "returns a player" do
    expected_response = %Player{life: 100, name: "banana", moves: %{move_rnd: :punch, move_avg: :kick, move_heal: :heal}}
    assert ExMon.create_player("banana", :punch, :kick, :heal) == expected_response
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns message" do
      player = Player.build("DevTeste", :soco, :chute, :cura)

      messages = capture_io(fn ->
      assert ExMon.start_game(player) == :ok
      end)

      assert messages =~ "The game is started"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"

    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("DevTeste", :soco, :chute, :cura)

      capture_io(fn -> ExMon.start_game(player) end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages = capture_io(fn ->
        ExMon.make_move(:chute)
      end)

      assert messages =~ "The player attacked the computer"
      assert messages =~ ":chute"
      assert messages =~ "status: :continue"
      assert messages =~ "turn: :computer"
    end

    test "when the move is invalid, returns an error message" do
      messages = capture_io(fn ->
        ExMon.make_move(:wrong)
      end)

      assert messages =~ "Invalid move: wrong"
    end
  end
end
