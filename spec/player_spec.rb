describe Player do
  before(:each) do
    @board = Board.new(false)
    @player = Player.new(@board, :white)
    @player2 = Player.new(@board, :black)
  end

  it "rejects invalid inputs" do
    expect(@player).to receive(:gets).and_return("z2, c4")
    expect(@player2).to receive(:gets).and_return("a9, c4")

    expect{ @player.play_turn }.to raise_error
    expect{ @player2.play_turn }.to raise_error
  end

  it "doesn't move other player's pieces" do
    expect(@player).to receive(:gets).and_return("b8, c6")
    expect(@player2).to receive(:gets).and_return("b8, c6")
    expect{ @player.play_turn }.to raise_error
    expect{ @player2.play_turn }.to_not raise_error
  end
end
