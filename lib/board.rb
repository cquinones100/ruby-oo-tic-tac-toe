require './lib/board-displayer/board_displayer.rb'

class Board 
  attr_accessor :board_array

  def initialize(size:)
    @board_array = Array.new(size**2)
  end

  def display
    BoardDisplayer.new(board_array: @board_array).display
  end

  def size
    @board_array.length
  end

  def update(character:, move:)
    index = move

    board_array[index] = character
  end
end
