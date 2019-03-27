class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @fire_upon  = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fire_upon
  end

  def fire_upon
    @fire_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def render(show_ships = false)
    if fired_upon? == false
      show_ships && @ship ? 'S' : '.'
    elsif @ship
      @ship.sunk? ? 'X' : 'H'
    else
      "M"
    end
  end

end
