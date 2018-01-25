class Cell

  attr_accessor :status, :content
  attr_reader :coordinates

  def initialize(coordinates)
    @status = nil
    @content ||= 'water'
    @coordinates = coordinates
  end

  def accept(ship)
    @content = ship
    ship.place!
  end


  def hit_it!
    if @content == 'water'
      @status = 'missed'
    else
      @status = 'hit'
      @content = "water"
    end
    return @status
  end
end
