class Board

  attr_reader :cells

  def initialize
    @cells = {}
    create_cells
  end

  def create_cells
    numbers = (1..4)
    letters = ("A".."D")
    letters.each {|letter|
    numbers.each {|number|
      coordinate = "#{letter}#{number}"
      @cells[coordinate] = Cell.new(coordinate)
    } }
    @cells
  end

end
