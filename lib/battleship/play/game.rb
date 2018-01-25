require "battle/area"
require "battle/cell"
require "player/player"

class Game

  attr_accessor :turn, :player_1, :player_2

  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @turn = nil
  end

  # Get opponent player
  def opponent
    self.turn == player_1 ?  player_2 : player_1
  end

  # To start war
  def start(player)
    missile = player.missiles.shift
    unless missile.nil?
      @status = opponent.area.hit(missile)
      puts "#{player.name.capitalize} fires a missile with target #{missile} which #{@status}"
      return @status == "hit"
    else
      puts "#{player.name.capitalize} has no more missiles left"
      return false
    end
  end

  # First Load Game
  def load
    @owner = player_1
    while(1)
      self.turn = @owner
      if !start(@owner)
        @owner = opponent
      end
      return print_result  if (player_1.missiles.empty? && player_2.missiles.empty?) || (player_1.area.is_all_ships_destroyed? || player_2.area.is_all_ships_destroyed?)
    end
  end

  # To print battle conclusion
  def print_result
    if (player_1.area.is_all_ships_destroyed?)
      puts "#{player_2.name.capitalize} won the battle"
    elsif (player_2.area.is_all_ships_destroyed?)
      puts "#{player_1.name.capitalize} won the battle"
    else
      puts "Both declare peace"
    end
  end
end
