class Piece
  COLORS = [:white, :black]
  attr_accessor :current_pos, :board, :color

  def initialize(current_pos, board, color)
    @current_pos = current_pos
    @board = board
    @color = color
    @board[current_pos] = self
  end


  def empty_spot?(pos)
    !board[pos]
  end

  def on_board?(pos)
    pos.all?{ |loc| loc < 8 && loc > -1 }
  end

  def can_move_to?(pos)
    on_board?(pos) &&
      (empty_spot?(pos) || board[pos].color != color)
  end

  def add(pos, dir)
    [ pos[0] + dir[0], pos[1] + dir[1] ]
  end

  def dup(board_dup)
    self.class.new(current_pos, board_dup, color)
  end

  def move_into_check?(pos)
    board_dup = board.dup
    board_dup.move!(current_pos, pos)

    board_dup.in_check?(color)
  end

  def valid_moves
    moves.reject { |pos| move_into_check?(pos) }
  end

end
