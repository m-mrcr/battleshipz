class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @hit        = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @hit
  end
#this still allows for firing on the same cell
#lets get this so the cell cannot be "hit" twice
  def fire_upon
    @hit = true
    @ship && @ship.hit
  end

  def render(played = false)
    if fired_upon? == false
      played && @ship ? 'S' : '.'
    elsif @ship
      @ship.sunk? ? 'X' : 'H'
    else
      "M"
    end
  end

end
