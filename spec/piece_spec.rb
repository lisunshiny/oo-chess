require 'rspec'
require 'piece'

add

describe Piece do
  it "has a moves method" do
    piece = Piece.new
    expect { piece.moves }.to_not raise_error
  end

  it "takes a position and a board" do
    pos = [2,3]
    board = instance_double("Board")

    expect { Piece.new }.to raise_error
    expect { Piece.new(pos, board)}.to_not raise_error
  end



end
