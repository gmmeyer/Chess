class Pawn < Piece

  def moves
    possible_moves = []

    if self.color == :white && @board[[position[0] + 1, position[1]]].nil?
      possible_moves << [position[0] + 1, position[1]]

      if self.position[0] == 1 && @board[[position[0] + 2, position[1] ]].nil?
         possible_moves << [position[0] + 2, position[1]]
       end

    end

    if self.color == :black && @board[[position[0] - 1, position[1]]].nil?
      possible_moves << [position[0] - 1, position[1]]

      if self.position[0] == 6 && @board[[position[0] - 2, position[1] ]].nil?
        possible_moves << [position[0] - 2, position[1]]
      end
    end

    possible_moves += check_capture
    possible_moves
  end

  def check_capture
    possible_moves = []
    positions = [[1,1],[1,-1]] if self.color == :white
    positions = [[-1,1],[-1,-1]] if self.color == :black
    positions.each do |p|
      new_position = [@position[0] + p[0], @position[1] + p[1]]
      if !@board[new_position].nil? && has_enemy?(new_position)
        possible_moves << new_position if check_move?(new_position)
      end
    end
    possible_moves
  end
end