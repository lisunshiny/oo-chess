class Pawn < Piece
  BLACK_SLIDE_DIR = [0, 1]
  BLACK_TAKE_DELTAS = [[1, 1], [-1, 1]]
  WHITE_TAKE_DELTAS = [[-1, -1], [1, -1]]
  WHITE_SLIDE_DIR = [0, -1]

  def initialize(pos, board, coloro)
    super(pos, board, color)
    first_move = true
  end

  def moves
    move_dirs

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

    while true
      break unless can_move_to?(pos)


  end




end
