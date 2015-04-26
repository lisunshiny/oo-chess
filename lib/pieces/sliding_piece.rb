require 'matrix'
require 'byebug'

class SlidingPiece < Piece
  DIAGONAL_DIRS = [ [-1, -1], [1, 1], [-1, 1], [1, -1]]
  STRAIGHT_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def moves
    move_dirs.inject([]) do |moves, dir|
      moves + moves_for(dir)
    end
  end

  def moves_for(dir)
    dir_moves = []
    next_spot = add(current_pos, dir)

    while can_move_to?(next_spot)
      dir_moves << next_spot
      next_spot = add(next_spot, dir)
    end

    dir_moves
  end
end
