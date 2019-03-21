require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardClass < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells_in_hash
    assert_instance_of Hash, @board.cells
  end

  def test_it_has_sixteen_objects_in_hash
    assert_equal 16, @board.cells.length
  end

  def test_it_has_cell_objects_in_hash
    assert @board.cells.values.all? {|value| value.class == Cell}
  end

  def test_it_has_valid_coordinates
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")
  end

end
