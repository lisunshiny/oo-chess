require 'colorize'

module Grid

  def populate_grid
    Piece::COLORS.each do |color|
      generate_pawn_row!(color)
      generate_piece_row!(color)
    end
    nil
  end

  def generate_pawn_row!(color)
    col = ( color == :black ? 6 : 1 )
    Board::BOARD_SIZE.times do |row|
      Pawn.new([row, col], self, color)
    end
    nil
  end

  def generate_piece_row!(color)
    col = (color == :black ? 7 : 0)
    type = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    type.each_with_index do |piece, row|
      piece.new([row, col], self, color)
    end
    nil
  end

  def render_grid
    rendering = "  A B C D E F G H"
    descending_nums = (1..Board::BOARD_SIZE).to_a.reverse
    descending_nums.each do |col|
      rendering << "\n#{col} "

      Board::BOARD_SIZE.times do |row|
        spot_render = self[[row, col - 1]].nil? ? "  " : " #{self[[row,col - 1]].render}"
        color = (row + col - 1).even? ? :on_light_magenta : :on_light_white

        rendering << spot_render.send(color)

      end
    end
    rendering
  end

  def display_grid
    puts render_grid
  end

end
