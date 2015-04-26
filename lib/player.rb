class Player
  attr_accessor :board, :color

  def initialize(color, board)
    @color = color
    @board = board
  end

  def play_turn
    board.display_grid
    puts "Please input the piece and destination, e.g. 'F5, E4'."
    puts "#{color.capitalize}'s move:"

    input = process_input(gets.chomp)

    raise "Can't move this piece" unless board[input[0]].color == color

    board.move(*input)

  # rescue StandardError => e
  #   puts "Error: #{e.message}"
  #   retry
  end

  def translate_input(input)
    move_str = input.split(",").map {|pos| pos.strip.split("") }

    move_str.map do |pos_str|
      pos_str.map do |coord|

        if ("1".."8").include?(coord)
          coord.to_i - 1
        else
          coord.upcase.ord - 65
        end
      end
    end
  end

  def process_input(input)
    unless input.match(/^[a-hA-H][1-8],\s?[a-hA-H][1-8]$/)
      raise "Invalid input!"
    end

    translate_input(input)
  end

end
