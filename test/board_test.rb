require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardClass < MiniTest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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

  def test_it_can_identify_valid_placement_by_ship_length
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_identify_orientation
    assert_equal :horizontal, @board.get_orientation(["A1", "A2", "A3"])
    assert_equal :vertical, @board.get_orientation(["A1", "B1", "C1"])
    assert_equal :diagonal, @board.get_orientation(["A1", "B2", "C3"])
  end

  def test_it_can_tell_if_coordinate_is_on_the_board
    assert @board.on_the_board?(["A1", "A2", "A3"])
    refute @board.on_the_board?(["G1", "G2", "G3"])
  end

  def test_it_can_tell_coordinates_are_consecutive
    assert @board.consecutive?(["A1", "A2", "A3"])
    assert @board.consecutive?(["A1", "B1", "C1"])
    refute @board.consecutive?(["A1", "B2", "D3"])
  end

  def test_it_can_identify_valid_placement_by_consecutive_coordinates
skip
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A1", "C1"])
    refute @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    refute @board.valid_placement?(@submarine, ["C1", "B1"])
  end

end
