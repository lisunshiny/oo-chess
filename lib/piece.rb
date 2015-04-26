class Piece
  COLORS = [:white, :black]
  attr_accessor :current_pos, :board, :color

  def initialize(current_pos, board, color)
    @current_pos = current_pos
    @board = board
    @color = color
  end

  def moves
  end

  def empty_spot?(pos)
    !board[pos]
  end

  def on_board?(pos)
    pos.all?{ |loc| loc < 8 && loc > -1 }
  end

  def can_move_to?(pos)
    on_board?(pos) &&
      (empty_spot?(pos) || board[pos].color == color)
  end

  def add(pos, dir)
    [ pos[0] + dir[0], pos[1] + dir[1] ]
  end

end
