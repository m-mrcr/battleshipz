require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/game_setup'

class GameSetupTest < MiniTest::Test

  def setup
    @game = GameSetup.new
  end

  def test_it_exists
    assert_instance_of GameSetup, @game
  end

  def test_it_initializes_with_opponents
    assert_instance_of Player, @game.computer
    assert_instance_of Player, @game.player
  end
end
