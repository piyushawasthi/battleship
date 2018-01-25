$LOAD_PATH.unshift File.expand_path('../../lib/battleship', __FILE__)

require "version"
require "play/game"
require "backend/read_file"

module Battleship
  extend ReadFile

  # Read Input file and load game
  def run
    puts "Sample Input : \n\n"
    feed_input
    puts "\n\nSample Output: \n\n"
    Game.new(@player_a, @player_b).load
  end
end
