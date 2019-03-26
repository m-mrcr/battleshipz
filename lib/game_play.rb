class GamePlay

  attr_reader :last_turn_player,
              :last_turn_computer

  def initialize(player, computer)
    @player = player
    @computer = computer
    @last_turn_player = last_turn_player
    @last_turn_computer = last_turn_computer
  end

  def show_boards
    sleep(1)
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
    status =  name.board.cells[input].render
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
    if @computer.board.cells[input].fired_upon?
      p "Please enter a valid coordinate: \n"
    else
      @computer.board.cells[input].fire_upon
      @last_turn_player = input
    end
  end

  def computer_chooses_coordinate
    input = @player.board.cells.keys.sample(1).first
    until @player.board.cells[input].fired_upon?
      @player.board.cells[input].fire_upon
      @last_turn_computer = input
      p "Your shot on #{@last_turn_player} #{status(@last_turn_player, @computer)}"
      p "My shot on #{@last_turn_computer} #{status(@last_turn_computer, @player)}"
    end
    show_boards
  end

end
