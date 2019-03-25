class Player

  attr_reader :ships

  def initialize(name)
    @name = name
    @board = Board.new
    @ships = ships
    add_ships
  end

  def add_ships
    @ships = [ Ship.new("Submarine", 2),
              Ship.new("Cruiser", 3) ]
  end

  def place_ships(name)

    @ships.each do |ship|

      if name == :computer
      potential_coordinates = []
          loop do
            potential_coordinates = @board.cells.keys.sample(ship.length)
            if @board.valid_placement?(ship, potential_coordinates)
              @board.place(ship, potential_coordinates)
              break
            end #ends if
          end #ends loop

      elsif name == :player
        puts "#{@board.render} \n"
        loop do
          puts "Enter coordinates for the #{ship.name} (#{ship.length} spaces): \n"
          puts "Example: A1 A2 A3 \n"
          input = gets.chomp.upcase.split(" ")
          puts "\n"
          if @board.valid_placement?(ship, input)
            @board.place(ship, input)
            @board.render(true)
            break
          else
            puts "Those are invalid coordinates. Please try again. \n"
          end #ends if

        end #ends loop

      end #ends if

    end #ends each

  end #ends method

end
