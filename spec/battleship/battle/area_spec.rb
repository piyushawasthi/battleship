require "spec_helper"


describe Area do

  let(:area)    { Area.new("player 1") }
  let(:ship_1) { Ship.new("player 1", "E", 5, "Q") }
  let(:cell)    { Cell.new("A1") }
  let(:ship_2) { Ship.new("player 1", "E", 5, "Q") } 

  before (:each) do
    Area.class_variable_set :@@height, "E"
    Area.class_variable_set :@@width, 5
  end

  context '#Intialize' do
    it 'created 25 cells area' do
      expect(area.create_cells.count).to eq 25
    end
  end

  context 'Ship placement' do
    before do
      allow_any_instance_of(Cell).to receive(:content).and_return(ship_1)
      area.place(ship_1,"A1")
    end

    it 'place ship on A1 location' do
      expect(area.cells["A1"].content). to eq ship_1
    end

    it 'place ship on A2 location' do
      expect(area.cells["A2"].content). to eq ship_1
    end 
  end

  context 'Ship placement failed' do
    before(:each) do
      allow(ship_1).to receive(:placed?).and_return(true)
    end
    it 'returns ArgumentError: That ship has already placed' do
      ship_1.place!
      expect(lambda{area.place(ship_1,"A1")}).to raise_error(ArgumentError)
    end
  end

  context 'Attack' do
    it 'returns missile missed' do
      area.hit("A1")
      expect(area.cells["A1"].status).to eq 'missed'
    end
    it 'returns missile hit successfully' do
      ship_2.place!
      area.hit("A1")
      expect(area.cells["A1"].content).to eq 'water' 
    end
  end
end
