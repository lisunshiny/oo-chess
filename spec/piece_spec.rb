require 'rspec'
require 'piece'

describe Piece do
  it "has a moves method" do
    piece = Piece.new([3,3], Board.new, :black)
    expect { piece.moves }.to_not raise_error
  end


end
