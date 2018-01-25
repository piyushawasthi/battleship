require "battle/area"
require "player/player"
require "ships/ship"
require_relative "validates"
require "pry"

module ReadFile
  include Validates

  # To Read data from input/data.txt file
  def feed_input
    File.open("#{Dir.pwd}/input/data.txt", "r").each_line do |line|
      puts line
      condition = line.split(':').first
      value = line.split(':').last.strip

      case condition

      when "Enter area boundaries"
        width, height = value.split
        validate_area(width, height)
        Area.define(height, width)
        @player_a = Player.new("player 1")
        @player_b = Player.new("player 2")
      when "Type for battleship 1"
        @type = value
        validate_ship_type(@type)
      when "Dimension for battleship 1"
        @x, @y = value.split(" ")
      when "Location of battleship 1 for player A"
        @starts_at_a = value
      when "Location of battleship 1 for player B"
        @starts_at_b = value
        ship1A = Ship.new("battelship_1_a", @x, @y, @type)
        ship1B= Ship.new("battelship_1_b", @x, @y, @type)
        @player_a.area.place(ship1A, @starts_at_a)
        @player_b.area.place(ship1B, @starts_at_b)
      when "Type for battleship 2"
        @type2 = value
        validate_ship_type(@type)
      when "Dimension for battleship 2"
        @x, @y = value.split
      when "Location of battleship 2 for player A"
        @starts_at_a = value
      when "Location of battleship 2 for player B"
        @starts_at_b = value
        ship2A = Ship.new("battelship_2_a", @x, @y, @type2)
        ship2B= Ship.new("battelship_2_b", @x, @y, @type2)
        @player_a.area.place(ship2A, @starts_at_a)
        @player_b.area.place(ship2B, @starts_at_b)
      when "Missile targets for player A"
        missiles_a = value.split(",")
        @player_a.load_missiles(missiles_a)
      when "Missile targets for player B"
        missiles_b = value.split
        @player_b.load_missiles(missiles_b)
      else
        puts "You gave me #{line.split(':').first} -- I have no idea what to do with that."
      end
    end
  end
end
