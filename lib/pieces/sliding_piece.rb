require 'matrix'

class SlidingPiece < Piece
  DIAGONAL_DIRS = [ [-1, -1], [1, 1], [-1, 1], [1, -1]]
  STRAIGHT_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def moves
    move_dirs.inject([]) do |moves, dir|
      moves << valid_moves_in_this_dir(dir)
    end
  end

  def can_move_to?(pos)
    empty_spot?(pos) || board[pos].color == color
  end

  def valid_moves_in_this_dir(dir)
    next_move_vector = Vector[dir] + Vector[pos]
    dir_moves = []

    while can_move_to?(next_move_vector)
      dir_moves << next_move_vector.to_a
      next_move_vector += Vector[dir]
    end

    dir_moves
  end
end
