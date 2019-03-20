require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_coordinate_of_cell
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_initiates_with_no_ship
    assert_nil @cell.ship 
  end

end
