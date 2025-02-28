defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "start the game state" do
      player = Player.build("DevTeste", :soco, :chute, :cura)
      computer = Player.build("Robotinic", :soco, :chute, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("DevTeste", :soco, :chute, :cura)
      computer = Player.build("Robotinic", :soco, :chute, :cura)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %ExMon.Player{life: 100, name: "DevTeste", moves: %{move_rnd: :soco, move_avg: :chute, move_heal: :cura}},
        computer: %ExMon.Player{life: 100, name: "Robotinic", moves: %{move_rnd: :soco, move_avg: :chute, move_heal: :cura}},
        turn: :player
      }


      assert expected_response == Game.info()
    end
  end
end
