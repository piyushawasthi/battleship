require "spec_helper"
require 'pry'
describe ReadFile do


  context "Validate file not empty" do
    before do
      @content = File.read("./input/data.txt").split("\n").join(':').split(":")
    end
    it 'Validate file not empty' do
      expect(@content.size).not_to be nil
    end

    it 'Validate file contain: Enter area boundaries' do
      expect(@content.include?("Enter area boundaries")).to be true
    end
    
    it 'Validate file contain: Type for battleship 1' do
      expect(@content.include?("Type for battleship 1")).to be true
    end
    
    it 'Validate file contain: Dimension for battleship 1' do
      expect(@content.include?("Dimension for battleship 1")).to be true
    end
    
    it 'Validate file contain: Location of battleship 1 for player A' do
      expect(@content.include?("Location of battleship 1 for player A")).to be true
    end
    
    it 'Validate file contain: Location of battleship 1 for player B' do
      expect(@content.include?("Location of battleship 1 for player B")).to be true
    end
    
    it 'Validate file contain: Type for battleship 2' do
      expect(@content.include?("Type for battleship 2")).to be true
    end
    
    it 'Validate file contain: Dimension for battleship 2' do
      expect(@content.include?("Dimension for battleship 2")).to be true
    end
    
    it 'Validate file contain: Location of battleship 2 for player A' do
      expect(@content.include?("Location of battleship 2 for player A")).to be true
    end
    
    it 'Validate file contain: Location of battleship 2 for player B' do
      expect(@content.include?("Location of battleship 2 for player B")).to be true
    end
    
    it 'Validate file contain: Missile targets for player A' do
      expect(@content.include?("Missile targets for player A")).to be true
    end
    
    it 'Validate file contain: Missile targets for player B' do
      expect(@content.include?("Missile targets for player B")).to be true
    end
  end
end
