require 'rspec'
require 'require_all'
require_all 'lib'

describe SteppingPiece do

  context "#moves" do
    it "knight does not go out of bounds" do
      knight = Knight.new([7,7], Board.new, :black)
      expect(knight.moves).to match_array([[6,5], [5,6]])
    end

    it "king does not go out of bounds" do
      king = King.new([0,0], Board.new, :black)
      expect(king.moves).to match_array([[1,1], [0,1], [1,0]])
    end

    it "does not move onto a piece of the same color" do
      board = Board.new
      knight = Knight.new([4,3], board, :white)
      king = King.new([2,4], board, :white)

      expect(knight.moves).to_not include([2,4])
    end
  end
end
