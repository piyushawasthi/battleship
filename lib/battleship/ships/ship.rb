class Ship

  attr_accessor :size_x, :size_y, :name, :type

  def initialize(name, x, y, type)
    @name       = name
    @size_x     = x
    @size_y     = y
    @type       = type
    @placed     = false
  end

  # To check ship is placed
  def placed?
    @placed
  end

  # To Place ship in cell -> content
  def place!
    @placed = true
  end
end
