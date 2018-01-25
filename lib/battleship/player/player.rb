class Player

  attr_accessor :name, :area, :missiles

  def initialize(name)
    @name = name
    @area = Area.new(self.name)
  end

  # To add missiles for player
  def load_missiles(missiles)
    @missiles = missiles
  end
end
