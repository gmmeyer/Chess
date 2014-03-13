class Render

  def initialize(board)
    @board = board
  end

  def render
    @board.grid.reverse.each do |row|
      row.each do |space|
        unless space.nil?
          print space.class.to_s[0..1] + " "
        else
          print "__ "
        end
      end
      print "\n"
    end
    nil
  end

end