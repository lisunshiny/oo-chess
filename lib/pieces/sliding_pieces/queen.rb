class Queen < SlidingPiece
  def move_dirs
    DIAGONAL_DIRS + STRAIGHT_DIRS
  end

  def render
    color == :black ? "♛" : "♕"
  end
  
end
