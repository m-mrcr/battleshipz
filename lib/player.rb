class Player

  attr_reader :ships

  def initialize(name)
    @name = name
    @board = Board.new
    @ships = []
  end

  def place_ships(name)
    if name == :computer
      #something
    elsif name == :player
      #something
    end
  end

end
