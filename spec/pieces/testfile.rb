require "require_all"
require_all "./lib"
board = Board.new
queen = Queen.new([4,4], board, :black)
board[[4,4]] = queen
queen.moves

board = Board.new

queen = Queen.new([3,3], board, :white)
