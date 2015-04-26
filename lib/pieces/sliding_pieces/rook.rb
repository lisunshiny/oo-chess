class Rook < SlidingPiece
  def move_dirs
    STRAIGHT_DIRS
  end

  def render
    color == :black ? "♜" : "♖"
  end
end
