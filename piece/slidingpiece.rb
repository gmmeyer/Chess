class SlidingPiece < Piece

  DIAGONALS = [[1,1],[1,-1],[-1,1],[-1,-1]]
  ORTHOGONALS = [[0,1],[1,0],[0,-1],[-1,0]]

  def moves
    possible_moves = []
    move_dirs.each do |dir|
      new_position = position
      new_position = new_position[0]+dir[0], new_position[1]+dir[1]

      while check_move?(new_position)
        possible_moves << new_position
        break if has_enemy?(new_position)
        new_position = new_position[0]+dir[0], new_position[1]+dir[1]
      end

    end
    possible_moves
  end

end

class Bishop < SlidingPiece

  def move_dirs
    DIAGONALS
  end

end

class Rook < SlidingPiece

  def move_dirs
    ORTHOGONALS
  end

end

class Queen < SlidingPiece

  def move_dirs
    ORTHOGONALS + DIAGONALS
  end

end