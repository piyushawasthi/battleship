require "spec_helper"

describe Ship do

  let(:name)    { 'MyShip' }
  let(:x)       { '1' }
  let(:y)       { '1' }
  let(:type)    { 'Q' }
  let(:player)  { double :player  }
  let(:ship)    { Ship.new(name, x, y, type) }

  context "Initialization" do

    it "return ship name 'MyShip'" do
      expect(ship.name).to eq 'MyShip'
    end

    it "return ship dimension '1 1'" do
      expect(ship.size_x).to eq '1'
      expect(ship.size_x).to eq '1'
    end

    it "return ship type 'Q'" do
      expect(ship.type).to eq 'Q'
    end
    
    it "return ship placed 'False' when ship created" do 
      expect(ship.placed?).to be false
    end
  end

  context "placed" do
    it "return ship placed successfully" do
      ship.place!
      expect(ship.placed?).to be true
    end
  end
end
