class Bishop < SlidingPiece
  def move_dirs
    DIAGONAL_DIRS
  end

  def render
    color == :black ? "♝" : "♗"
  end
end
