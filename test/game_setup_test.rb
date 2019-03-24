require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game_setup'
require './lib/player'

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
