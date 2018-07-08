require './lib/cell-checkers/left_corner_cell.rb'
require './lib/cell-checkers/right_corner_cell.rb'
require './lib/cell-checkers/other_cell.rb'
require './lib/cell-checkers/center_cell.rb'

class CellFactory
  attr_accessor :won, :cell

  def initialize(board_array:, position:)
    @board_array = board_array
    @position = position
    @board_width = Math.sqrt(board_array.length).to_i
    @counter = 0

    if is_center?
      return @cell = CenterCell.new(board_array: @board_array, position: @position)
    end

    if is_right_corner?
      return @cell = RightCornerCell.new(board_array: @board_array, position: @position)
    end

    if is_left_corner?
      return @cell = LeftCornerCell.new(board_array: @board_array, position: @position)
    end

    @cell = OtherCell.new(board_array: @board_array, position: @position)
  end

  private

  def is_left_corner?
    @position == 0 || @position == @board_array.length - @board_width 
  end

  def is_right_corner?
    @position == @board_array.length - 1 || @position == @board_width - 1
  end

  def is_center?
    @board_width % 2 == 1 && @position == @board_array.length / 2
  end
end

