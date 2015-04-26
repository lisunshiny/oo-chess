require 'rspec'
require 'require_all'
require_all 'lib'

describe Board do
  context "#move" do
    before(:each) do
      @board = Board.new
      @bishop = Bishop.new([2,1], @board, :black)
      @rook = Rook.new([7,1], @board, :white)
    end

    it "updates the piece and board with a valid move" do
      @board.move([7,1], [3,1])

      expect(@rook.current_pos).to eq([3,1])
      expect(@board[[3,1]]).to be_a(Rook)
      expect(@board[[7,1]]).to be_nil
    end
    it "raises an error if the move is invalid" do
      expect{ @board.move([7,1],[6,2]) }.to raise_error
      expect{ @board.move([6,3],[6,2]) }.to raise_error
    end

    it "can take pieces" do
      @board.move([7,1], [2,1])
      expect(@board[[2,1]]).to be_a(Rook)
    end
  end

  context "#in_check?" do
    before(:each) do
      @board = Board.new
      @king = King.new([7,6], @board, :black)
      @bishop = Bishop.new([2,1], @board, :white)
    end

    it "detects when king is threatened" do
      expect(@board.in_check?(:black)).to be_truthy
    end

    it "doesn't raise false alarms" do
      expect(@board.in_check?(:white)).to be_falsey
    end
  end

  context "#populate_grid" do
    it "can start with a populated board" do
      board = Board.new(false)
      expect(board.grid).to include(8)
    end


  end
end
