class Knight < SteppingPiece
  def move_deltas
    [ [1, 2],
      [2, 1],
      [1, -2],
      [2, -1],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2] ]
  end

  def render
    color == :black ? "♞" : "♘"
  end
end
