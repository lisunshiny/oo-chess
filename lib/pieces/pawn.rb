class Pawn < Piece
  WHITE_SLIDE_DIR = [0, -1]
  WHITE_TAKE_DELTAS = [[-1, 1], [-1, -11]]
  BLACK_TAKE_DELTAS = [[1, 1], [1, -1]]
  BLACK_SLIDE_DIR = [0, 1]

  attr_accessor :first_move

  def initialize(current_pos, board, color)
    @first_move = true
    super(current_pos, board, color)
  end

  def moves
    take_moves + slide_moves
  end

  def slide_dir
    color == :black ? BLACK_SLIDE_DIR : WHITE_SLIDE_DIR
  end

  def take_deltas
    color == :black ? BLACK_TAKE_DELTAS : WHITE_TAKE_DELTAS
  end

  def take_moves
    moves = []

    take_deltas.each do |delta|
      possible_move = add(current_pos, delta)

      moves << possible_move if can_take?(possible_move)
    end
    moves
  end

  def can_take?(pos)
    on_board?(pos) && !empty_spot?(pos) && board[pos].color != color
  end

  def can_move_to?(pos)
    on_board?(pos) && empty_spot?(pos)
  end

  def slide_moves
    moves = []
    possible_move = add(slide_dir, current_pos)
    while can_move_to?(possible_move)
      moves << possible_move

      break if self.first_move == false

      possible_move = add(slide_dir, possible_move)
      self.first_move = false
    end
    moves
  end

  def render
    color == :black ? "♟" : "♙"
  end
end
