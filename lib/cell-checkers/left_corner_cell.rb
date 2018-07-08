require './lib/cell-checkers/cell.rb'

class LeftCornerCell < Cell
  def won?
    return true if horizontal_win?
    return true if vertical_win?

    if top?
      return true if bottom_diagonal_win?
    end

    if bottom?
      return true if top_diagonal_win?
    end

    false
  end

  def top?
    @position == 0
  end

  def bottom?
    @position == @board_array.length - @board_width 
  end
end
