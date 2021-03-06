class Board
  attr_accessor :grid

  BOARD_SIZE = 8

  def initialize(empty = true)
    @grid = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
    populate_grid unless empty
  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    grid[pos[0]][pos[1]] = piece
  end

  def in_check?(color)
    king_pos = find_king_pos(color)
    grid.flatten.any? do |piece|
      next if piece == nil || piece.color == color
      piece.moves.include?(king_pos)
    end
  end

  def move(start_pos, end_pos)
    piece = self[start_pos]

    raise "There's nothing to move." if piece.nil?
    raise "Piece can't move there." unless piece.moves.include?(end_pos)
    raise "You're in check!" unless piece.valid_moves.include?(end_pos)
    raise "Cannot move into check." if piece.move_into_check?(end_pos)

    move!(start_pos, end_pos)
  end

  def move!(start_pos, end_pos)

    piece = self[start_pos]

    self[end_pos], self[start_pos] = self[start_pos], nil
    piece.current_pos = end_pos

    piece.first_move = false if piece.class == Pawn
  end

  def find_king_pos(color)
    grid.flatten.each do |piece|
      return piece.current_pos if piece.class == King && piece.color == color
    end
  end

  def dup
    board_dup = Board.new

    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        next if self[[row, col]].nil?
        board_dup[[row, col]] = self[[row,col]].dup(board_dup)
      end
    end

    board_dup
  end

  def checkmate?(color)
    return false unless in_check?(color)
    # byebug
    grid.flatten.each do |piece|
      next if piece.nil? || piece.color != color
      return false if !piece.valid_moves.empty?
    end
    true
  end

  include Grid

end
