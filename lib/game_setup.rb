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
      if winner?
        break
      end
    end
    self.end_game
    self.replay?
  end

  def winner?
    if @computer.ships.all? {|ship| ship.sunk?} == true ||
       @player.ships.all? {|ship| ship.sunk?} == true
      return true
    end
  end

  def end_game
    if winner = @player
      puts "\n ------------ \n \n Player Won \n \n ------------ \n"
    elsif winner = @computer
      puts "\n ------------ \n \n Player Lost \n \n ------------ \n"
    end
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

  def replay?
    puts "Would you like to play again?"
    puts "Type Yes or No"
    input = gets.chomp.upcase
    if input == "YES" || input == "Y"
      welcome
    elsif input == "NO" || input == "N"
      exit
    else
      p "INVALID INPUT"
    end
  end

end
