require './lib/board-displayer/cell_builder.rb'

class BoardDisplayer 
  def initialize(board_array:)
    @board_array = board_array
    @size = Math.sqrt(board_array.length)
  end

  def display
    puts build_display
  end

  private

  def build_display
    @board_array.each_with_index.reduce('') do |acc, (curr, index)| 
      acc += CellBuilder.new(character: curr, board_size: @size, index: index).cell
    end
  end
end
