require 'require_all'
require_all 'lib'

describe Pawn do
  before(:each) do
    @board = Board.new
    @pawn = Pawn.new([1,1], @board, :white)
    @queen = Queen.new([2,2], @board, :black)
  end

  context "#move" do
    it "moves twice on the first move and can take" do
      expect(@pawn.moves).to match_array([[1, 2], [1, 3], [2, 2]])
    end
  end

  it "is blocked by a piece" do
    knight = Knight.new([1, 2], @board, :white)
    expect(@pawn.moves).to match_array([[2, 2]])
  end

  it "only moves twice once" do
    @board.move([1, 1], [2, 2])
    expect(@pawn.moves).to match_array([[2, 3]])
  end
end
