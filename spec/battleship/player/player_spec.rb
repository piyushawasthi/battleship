require "spec_helper"

describe Player do
  
  let(:player)  {Player.new("player 1")}
  let(:missile) {"A1"}

  before (:each) do
    Area.class_variable_set :@@height, "E"
    Area.class_variable_set :@@width, 5
  end

  context "Initialization" do
    it "return new player name" do
      expect(player.name).to eq "player 1"
    end

    it "return new player battle area name" do
      expect(player.area.name).to eq "player 1"
    end
  end

  context "load_missiles" do
    it "return new player missile" do
      player_missile = player.load_missiles(missile)
      expect(player_missile).to eq missile
    end
  end

end