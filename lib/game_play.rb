class GamePlay

  attr_reader :last_turn_player,
              :last_turn_computer

  def initialize(player, computer)
    @player = player
    @computer = computer
    @last_turn_player = last_turn_player
    @last_turn_computer = last_turn_computer
    @fired_upon = []
  end

  def show_boards
    puts "=============COMPUTER BOARD============="
    puts "\n"
    puts @computer.board.render
    puts "\n"
    puts "==============PLAYER BOARD=============="
    puts "\n"
    puts @player.board.render(true)
    puts "\n"
  end

  def status(input, name)
    status = name.board.cells[input].render
    case status
    when 'H'
      "was a hit."
    when 'M'
      "was a miss."
    when 'X'
      "sunk a ship."
    end
  end

  def player_chooses_coordinate
    puts "Enter the coordinate for your shot: \n"
     input = gets.chomp.upcase
     loop do
      if @computer.board.valid_coordinate?(input) == false
          puts "Please enter a valid coordinate: \n"
          input = gets.chomp.upcase
      elsif @computer.board.valid_coordinate?(input) == true &&
            @computer.board.cells[input].fired_upon? == true
              puts "This coordinate has already been fired upon. Please enter another: \n"
              input = gets.chomp.upcase
      else
        @computer.board.cells[input].fire_upon
        @last_turn_player = input
        break
      end
    end
  end

  def computer_chooses_coordinate
    input = @player.board.cells.keys.sample(1).first
    unless @computer.board.cells[input].fired_upon?
      @player.board.cells[input].fire_upon
      @fired_upon.push(input)
      @last_turn_computer = input
    end
    sleep(1)
    puts "\n"
    show_boards
    puts "Your shot on #{@last_turn_player} #{status(@last_turn_player, @computer)}"
    puts "My shot on #{@last_turn_computer} #{status(@last_turn_computer, @player)}"
    puts "\n"
  end

end
