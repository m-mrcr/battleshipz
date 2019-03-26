class GameSetup

  attr_reader :computer,
              :player

  def initialize
    @computer = Player.new(:computer)
    @player = Player.new(:player)
    @gameplay = GamePlay.new(@player, @computer)
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to Quit"
    input = gets.chomp.upcase
    if input == "P"
      play
    elsif input == "Q"
      exit
    else
      p "INVALID INPUT"
    end
  end

  def play
    place_computer_ships
    place_player_ships
    @gameplay.show_boards
    loop do
      @gameplay.player_chooses_coordinate
      @gameplay.computer_chooses_coordinate
      until 

  end

  def place_computer_ships
    @computer.place_ships(:computer)
  end

  def place_player_ships
    puts "\nI have laid out my ships on the grid."
    puts "You now need to lay out your #{@player.ships.length} ships.\n"
    puts "\n"
    @player.place_ships(:player)
  end

end
