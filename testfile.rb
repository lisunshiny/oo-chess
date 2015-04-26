require "require_all"
require_all "./lib"
board = Board.new
board.display_grid
queen = Queen.new([4,4], board, :black)
board[[4,4]] = queen
queen.moves

board = Board.new

Rook.new([1,1], board, :black)
Rook.new([4, 0], board, :black)
Bishop.new([5, 3], board, :black)
pawn = Pawn.new([6, 1], board, :white)
king = King.new([6, 0], board, :white)
rook =Rook.new([7, 0], board, :white)

queen = Queen.new([3,3], board, :white)
