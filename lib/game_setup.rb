require './lib/cell'
require './lib/ship'
# require './lib/game_play'
# require './lib/player'
require './lib/board'
require 'pry'

class GameSetup

  attr_reader :computer,
              :human

  def initialize
    # @computer = Player.new(:computer)
    # @human = Player.new(:human)

  end

  def welcome
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit"
    input = gets.chomp.upcase
      if input == "P"
        p "Let's Play"
      elsif input == "Q"
        "Sorry to see you go."
      else
        p 'INVALID INPUT'
        welcome
      end
  end


end #ends class
