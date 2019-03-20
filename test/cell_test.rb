require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def setup
    @cell = Cell.new
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

end
