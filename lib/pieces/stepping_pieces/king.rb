class King < SteppingPiece
  def move_deltas
    [ [1, 1], [0, 1], [1, 0], [-1, 0], [0, -1], [-1, -1] ]
  end
end
