class GameSetup

  attr_reader :computer,
              :player

  def initialize
    @computer = Player.new(:computer)
    @player = Player.new(:player)
  end

  def welcome
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to Quit"
    input = gets.chomp.upcase
    if input == "P"
      start
    elsif input == "Q"
      exit
    else
      p "INVALID INPUT"
    end
  end

  def start
    place_computer_ships
    place_player_ships
  end

  def place_computer_ships
    @computer.place_ships(:computer)
  end

  def place_player_ships
    p "I have laid out my ships on the grid."
    p "You now need to lay out your #{@player.ships.length} ships"


  end

end
