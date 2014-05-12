# encoding: utf-8

require 'colorize'

require_relative './board'

require_relative './piece/piece'
require_relative './piece/slidingpiece'
require_relative './piece/steppingpiece'
require_relative './piece/pawn'

require_relative './game'

require_relative './render'

require_relative './player/player'
require_relative './player/humanplayer'
require_relative './player/computerplayer'


chess_game = Game.new

render = Render.new(chess_game.board)


if __FILE__ == $PROGRAM_NAME

  chess_game.play

end