# All Validation should write here!

module Validates
  #  Validate Area
  def validate_area(width, height)
    raise ArgumentError, "Invalid width #{width}, Width should be 1-9" unless width.to_i.between?(1, 9)
    raise ArgumentError, "Invalid height #{height}, Width should be A-Z" unless height.between?("A", "Z")
  end

  # Validate ShipType
  def validate_ship_type(type)
    raise ArgumentError, "Invalid Ship type #{type}, Ship type should be {'P', 'Q'}" unless ["P", "Q"].include?(type)
  end
end
