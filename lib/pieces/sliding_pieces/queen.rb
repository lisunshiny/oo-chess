class Queen < SlidingPiece
  def move_dirs
    DIAGONAL_DIRS + STRAIGHT_DIRS
  end
end
