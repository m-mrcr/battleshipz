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

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    coordinates.length == ship.length
    # get_orientation
  end

  def get_orientation(coordinates)
    letters = coordinates.map {|c| c[0].ord}
    numbers = coordinates.map {|c| c[1].to_i}
    if numbers.all? {|n| n == numbers[0]}
      :vertical
    elsif letters.all? {|l| l == letters[0]}
      :horizontal
    else
      :diagonal
    end
  end

  def on_the_board?(coordinates)
    coordinates.all? {|c| valid_coordinate?(c)}
  end

  def consecutive?(coordinates)
    orientation = get_orientation(coordinates)
    letters = coordinates.map {|c| c[0].ord}
    numbers = coordinates.map {|c| c[0].to_i}
    if orientation == :horizontal
      numbers.each_cons(2) do |a, b|
        b != a + 1
      end
      return true
    elsif orientation == :vertical
      letters.each_cons(2) do |a, b|
        b != a + 1
      end
      return true
    else
      return false
    end
  end


end
