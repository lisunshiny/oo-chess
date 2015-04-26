class Piece
  COLORS = [:white, :black]
  attr_accessor :pos, :board

  def initialize(current_pos, board, color)
    @current_pos = current_pos
    @board = board
    @color = color
  end

  def moves
  end

  def empty_spot?(pos)
    !!board[pos]
  end

  def

end
