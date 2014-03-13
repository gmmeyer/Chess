# encoding: utf-8

class Render



  COLOR_CONVERSION = {
    [:white, King] => "\u2654",
    [:white, Queen] => "\u2655",
    [:white, Rook] => "\u2656",
    [:white, Bishop] => "\u2657",
    [:white, Knight] => "\u2658",
    [:white, Pawn] => "\u2659",
    [:black, King] => "\u265A",
    [:black, Queen] => "\u265B",
    [:black, Rook] => "\u265C",
    [:black, Bishop] => "\u265D",
    [:black, Knight] => "\u265E",
    [:black, Pawn] => "\u265F"
  }





  def initialize(board)
    @board = board
  end

  def render
    @board.grid.reverse.each do |row|
      row.each do |space|
        unless space.nil?
          print COLOR_CONVERSION[[space.color, space.class]].encode('utf-8') + ' '
        else
          print "_ "
        end
      end
      print "\n"
    end
    nil
  end

  def board_color(string, i, j, space)
    if (i + j).even?
      string = string.colorize(:background => :black)
    else
      string = string.colorize(:background => :red)
    end

    if space.nil?
      return string
    elsif space.color == :black
      string = string.colorize(:color => :magenta)
    else
      string = string.colorize(:color => :white)
    end
    string
  end



  def rendera
    a = ''


    @board.grid.reverse.each_with_index do |row, i|
      row.each_with_index do |space, j|
        unless space.nil? 
          print board_color(' ' + COLOR_CONVERSION[[space.color, space.class]].encode('utf-8') + ' ', i, j, space)
        else
          print board_color('   ', i, j, space)
        end
      end
       print "\n"
    end
    a
  end

end