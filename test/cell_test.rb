require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def setup
    @cell    = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1  = Cell.new("B4")
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
    # @cruiser.hit => not sure on this one...
    assert_equal 2, @cell.ship.health
  end

  def test_fired_upon_returns_true_after_fire_upon
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  # def test_cell_has_not_been_fired_on
  #   assert_equal ".", @cell_1.render
  # end
  #
  # def test_render_of_a_miss_when_fire_upon
  #   @cell_1.fire_upon
  #   assert_equal "M", @cell_1.render
  # end

end
