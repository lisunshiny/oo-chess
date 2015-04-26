require 'rspec'
require 'require_all'
require 'pieces/sliding_piece'
require_all 'lib/pieces/sliding_pieces'

describe Queen do
  it "has appropriate move_dirs" do
    queen = Queen.new
    move_dirs = queen.move_dirs
    expect(move_dirs).to be_an(Array)
    expect(move_dirs.uniq.length).to be(8)
  end

end

describe Bishop do
  it "has appropriate move_dirs" do
    bishop = Bishop.new
    move_dirs = bishop.move_dirs
    expect(move_dirs).to be_an(Array)
    expect(move_dirs.uniq.length).to be(4)
  end

end

describe Rook do
  it "has appropriate move_dirs" do
    rook = Rook.new
    move_dirs = rook.move_dirs
    expect(move_dirs).to be_an(Array)
    expect(move_dirs.uniq.length).to be(4)

  end

end
