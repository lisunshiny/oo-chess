class Board
  attr_accessor :grid

  def initialize(empty = true)
    @grid = Array.new(8) { Array.new(8) }
    populate_grid unless empty
  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    grid[pos] = piece
  end
end
