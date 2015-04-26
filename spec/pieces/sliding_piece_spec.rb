require 'rspec'
require 'require_all'
require 'pieces/sliding_piece'
require_all 'lib'

describe Bishop do

  it "has appropriate move_dirs" do
    bishop = Bishop.new([0,0], Board.new, :black)
    move_dirs = bishop.move_dirs
    expect(move_dirs).to be_an(Array)
    expect(move_dirs.uniq.length).to be(4)
  end

end

describe Rook do

  it "has appropriate move_dirs" do
    rook = Rook.new([0,0], Board.new, :black)
    move_dirs = rook.move_dirs
    expect(move_dirs).to be_an(Array)
    expect(move_dirs.uniq.length).to be(4)

  end

end

describe Queen do
  before(:each) do
    @board = Board.new
    @queen = Queen.new([0,0], @board, :black)
    @board[[4,4]] = @queen
  end

  it "has appropriate move_dirs" do
    move_dirs = @queen.move_dirs
    expect(move_dirs).to be_an(Array)
    expect(move_dirs.uniq.length).to be(8)
  end

  context "#moves" do
    it "moves properly" do
      moves = Array.new(7) { |el, index| [el + 1] * 2 }  +
                Array.new(7) { |el, index| [el + 1, 0] } +
                Array.new(7) { |el, index| [0, el + 1] }


      expect(@queen.moves).to eq(moves)
    end

  end
end
