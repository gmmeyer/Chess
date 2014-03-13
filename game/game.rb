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
        raise NotImplementedError if @board.checkmate(player_turn.color)
        player_turn.play_turn(@board)
        render.render
      end

    end
  end
end