require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def setup
    @cell    = Cell.new("B4")
    @cell_1   = Cell.new("B4")
    @cell_2   = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
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

  def test_cell_initiates_as_empty
    assert @cell.empty?
  end

  def test_ship_can_be_placed
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

  def test_cell_fired_upon_defaults_to_false
    refute @cell.fired_upon?
  end

  def test_a_placed_ship_loses_health_when_fired_upon
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
  end

  def test_fired_upon_returns_true_after_fire_upon
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_cell_has_not_been_fired_on
    assert_equal ".", @cell_1.render
  end

  def test_render_of_a_miss_when_fire_upon
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_cell_with_ship_shows_s
    @cell_2.place_ship(@cruiser)
    assert_equal "S", @cell_2.render(true)
  end

  def test_cell_shows_H_when_fired_upon
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
    refute @cruiser.sunk?
  end

  def test_cell_shows_x_when_ship_is_sunk
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    @cell_2.fire_upon
    @cell_2.fire_upon
    assert @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end

end
