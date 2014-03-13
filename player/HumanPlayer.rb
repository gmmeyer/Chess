class HumanPlayer < Player

  def input_move
    puts "What's your move?"
    puts "Where are you moving from? [row, column]"
    move_from = gets.chomp.split(',').map!{|x| x.to_i}
    puts "Where are you moving to? [row, column]"
    move_to = gets.chomp.split(',').map!{|x| x.to_i}

    [move_from, move_to]
  end

end