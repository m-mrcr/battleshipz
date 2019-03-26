class GamePlay

  def initialize(player, computer)
    @player = player
    @computer = computer
    @last_turn_player = last_turn_player
    @last_turn_computer = last_turn_computer
  end

  def show_boards
    sleep(2)
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def status(input)
    status =  @computer.board.cells[input].render
    case status
    when 'H'
      puts "Your shot on #{input} was a hit."
    when 'M'
      puts "Your shot on #{input} was a miss."
    when 'X'
      puts "Your shot on #{input} sunk a ship."
    end
  end

  def player_chooses_coordinate
    puts "Enter the coordinate for your shot: \n"
    input = gets.chomp.upcase.to_s
    if @computer.board.cells[input].fired_upon?
      p "Please enter a valid coordinate: \n"
    else
      @computer.board.cells[input].fire_upon
      @last_turn_player = input
    end
  end

  def computer_chooses_coordinate
    input = @user.board.cells.sample(1)
    unless @user.board.cells[input].fired_upon?
      @user.board.cells[input].fire_upon
      @last_turn_computer = input
      p "Your shot on #{@last_turn_player} was a #{status(@last_turn_player)}"
      p "My show on #{@last_turn_computer} was a #{status(@last_turn_computer)}"
    end
    show_boards
  end

end
