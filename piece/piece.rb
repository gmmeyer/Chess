class Piece

  attr_reader :color
  attr_accessor :position

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def moves
    raise "DON'T DO THAT"
  end

  def valid_moves
    old_pos = self.position
    old_piece = self
    safe_moves = []

    moves.each do |move|
      duped_board = @board.dup
      duped_piece = duped_board[old_pos]
      duped_board.move!(old_pos, move)
      duped_piece.position = move

      unless duped_board.in_check?(old_piece.color)
        safe_moves << move
      end
    end
    safe_moves
  end

  def space_full?(pos)
    !@board[pos].nil? && @board[pos].color == self.color
  end

  def has_enemy?(pos)
    !@board[pos].nil? && @board[pos].color != self.color
  end

  def dup(old_piece, new_board)
    old_piece.class.new(new_board, old_piece.position, old_piece.color)
  end

  #move to board class as well
  def check_move?(new_position)
    if new_position[0].between?(0,7) &&
       new_position[1].between?(0,7) &&
       !space_full?(new_position)
      return true
    end
    false
  end

end