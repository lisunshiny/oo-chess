class SteppingPiece < Piece
  def moves
    moves = []

    move_deltas.each do |delta|
      possible_move = add(current_pos, delta)
      moves << possible_move if can_move_to?(possible_move)
    end

    moves
  end
end
