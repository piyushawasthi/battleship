require "spec_helper"

describe Game do

  let(:area_1)      { double :area, height: "E", width: 5, name: "player 1" }
  let(:area_2)      { double :area, height: "E", width: 5, name: "player 1" }
  let(:player_1)    { double :player, ships: "P", area: area_1, name: "player 1"  }
  let(:player_2)    { double :player, ships: "P", area: area_2, name: "player 2" }
  let(:P)           { double :ship }
  let(:game)        { Game.new(player_1.name, player_2.name) }

  context "Initialization" do
  
    it "return player 1 set successfully" do   
      expect(game.player_1).to eq "player 1"  
    end
   
    it "return player 2 set successfully" do   
      expect(game.player_2).to eq "player 2"
    end

    it "return turn 'nil'" do   
      expect(game.turn).to eq nil
    end
  
  end

  context "#opponent" do
    it "return player1's turn" do
      game.turn = player_1
      expect(game.turn.name).to eq player_1.name
    end
    
    it "return opponent turn" do
      game.turn = player_2
      game.opponent
      expect(game.turn.name).to eq player_2.name
    end
  end

  context "#start" do
    it "return player_1 hit successfully" do
      allow_message_expectations_on_nil
      game.turn = player_1
      allow(player_2.area).to receive(:hit).with("B2")
      expect(game.turn.name).to eq player_1.name
    end


    it "return player_1 missed" do
      allow_message_expectations_on_nil
      allow(player_2.area).to receive(:hit).with("B2")
      game.turn = player_2
      expect(game.turn.name).to eq player_2.name
    end
  end

  context "#print_result" do
    it "return player_1 won the battle" do
      game.opponent {|cell| expect(cell.content == "water")}
    end
  end

end
