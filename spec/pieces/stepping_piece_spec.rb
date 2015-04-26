require 'rspec'
require 'require_all'
require_all 'lib'

describe King do

  context "#move" do
    it "does not go out of bounds" do
      king = King.new([0,0], Board.new, :black)
      expect(king.moves).to eq([[1,1], [0,1], [1,0]])
    end
  end
end
