class Game

  attr_accessor :board

  def initialize

    @board = Board.new
    @player1 = HumanPlayer.new(:white)
    @player2 = HumanPlayer.new(:black)

  end

  def play
    render
    loop do
      [@player1, @player2].each do |player_turn|

        if @board.checkmate(player_turn.color)
          return winner(color)
        end

        player_turn.play_turn(@board)
        render.render
      end

    end
  end

  def winner(color)
    @board.checkmate(player_turn.color)
    puts "That's checkmate."
    puts "Congradulations, #{color}."
  end
end