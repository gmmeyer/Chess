class Player

  attr_reader :color

  def initialize(color)
    @color = color

  end

  def play_turn(board)

    begin
      start_pos, end_pos = input_move
      if board[start_pos].color != color
        raise StandardError.new "That's not your piece!"
      end
      board.move(start_pos, end_pos)
    rescue StandardError => e
      puts "#{e.message}"
      retry
    end
  end
end