class GamePlay

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def show_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def player_chooses_coordinate
    puts "Enter the coordinate for your shot. \n"
    input = gets.chomp.upcase
    unless @player.board.cells[input].fired_upon?
      @player.board.cells[input].fire_upon
    end
    show_boards
  end

end
