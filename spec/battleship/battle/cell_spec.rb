require "spec_helper"

describe Cell do

  let(:cell)  { Cell.new('A1') }
  let(:ship)  { double :ship   }
  let(:grid) { double :grid  }


  context 'Initialization' do
    
    it "return cell is empty" do
      expect(cell.status).to eq nil
    end

    it 'return cell contain water' do
      expect(cell.content).to eq 'water'
    end

    it 'return cell coordinates' do
      expect(cell.coordinates).to match(/[A-J]\d/)
    end

  end

  context 'Place ship in cell' do
    
    it "Place ship successfully" do
      allow(ship).to receive(:place!).and_return(true)
      cell.accept(ship)
      expect(cell.content).to eq ship
    end

  end

  context 'During the Game' do
    
    it 'return ship hit' do
      expect(cell).to respond_to(:hit_it!)
    end

    it "return 'missed' if the content is water" do
      cell.hit_it!
      expect(cell.status).to eq 'missed'
    end

    it "return 'hit' if the content is a ship" do
      cell.content = ship
      cell.hit_it!
      expect(cell.status).to eq 'hit'
    end
  end
end