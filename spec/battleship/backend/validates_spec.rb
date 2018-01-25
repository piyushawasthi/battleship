require "spec_helper"

describe Validates do

  class Validate
    include Validates
  end

  before do
    @validate = Validate.new
  end

  let(:width) { 5 }
  let(:height) { "E" }

  context "Validate area width" do
    let(:width) { "A" }
    it 'returns ArgumentError: Invalid width A, Width should be 1-9' do
      expect { @validate.validate_area(width, height) }.to raise_error(ArgumentError)
    end
  end

  context "Validate area height" do
    let(:height) { 5 }
    it 'returns ArgumentError: Invalid height 5, Height should be A-Z' do
      expect { @validate.validate_area(width, height) }.to raise_error(ArgumentError)
    end
  end

  context "Validate area height" do
    let(:type) { "M" }
    it 'returns ArgumentError: Invalid Ship type M, Ship type should be {"P", "Q"}' do
      expect { @validate.validate_ship_type(type) }.to raise_error(ArgumentError)
    end
  end
end
