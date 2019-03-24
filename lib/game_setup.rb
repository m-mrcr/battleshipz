require './lib/cell'
require './lib/ship'
# require './lib/game_play'
require './lib/player'
require './lib/board'
require 'pry'

class GameSetup

  attr_reader :computer,
              :player

  def initialize
    @computer = Player.new(:computer)
    @player = Player.new(:player)
  end

end #ends class
