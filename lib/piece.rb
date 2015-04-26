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

end
