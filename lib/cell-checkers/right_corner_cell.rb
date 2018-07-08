require './lib/cell-checkers/cell.rb'

class RightCornerCell < Cell
  def won?
    return true if horizontal_win?
    return true if vertical_win?

    if top?
      return true if top_diagonal_win?
    end

    if bottom?
      return true if bottom_diagonal_win?
    end

    false
  end

  private

  def horizontal_win?
    incrementer = lambda { |counter| counter -= 1 }
    end_condition = lambda { |counter| counter >= @position - @board_width + 1 }

    check_range(start: @position, end_condition: end_condition, incrementer: incrementer)
  end

  def vertical_win?
    incrementer = lambda { |counter| counter += @board_width }
    end_condition = lambda { |counter| counter <= @board_array.length - 1 }

    check_range(start: @board_width- 1, end_condition: end_condition, incrementer: incrementer)
  end


  def top?
    @position == @board_width - 1
  end

  def bottom?
    @position == @board_array.length - 1
  end
end
