class SteppingPiece < Piece

  def moves
    possible_moves = []
    move_pattern.each do |move|
      new_position = [position[0] + move[0]] + [position[1] + move[1]]
      if check_move?(new_position)
        possible_moves << new_position
      end
    end
    possible_moves
  end

end

class Knight < SteppingPiece

  def move_pattern
    [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
  end

end

class King < SteppingPiece

  def move_pattern
    [[1,1],[1,-1],[-1,1],[-1,-1],[0,1],[1,0],[0,-1],[-1,0]]
  end

end