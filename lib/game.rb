require 'require_all'
require_all 'lib'

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new(false)
    @players = [Player.new(:white, @board), Player.new(:black, @board)]
  end

  def play
    current_player = players[0]

    while true
      break if board.checkmate?(current_player.color)
      current_player.play_turn
      current_player = (current_player == players[0] ? players[1] : players[0])
    end

    return "Good game. #{current_player.color.capitalize} loses."
  end
end
