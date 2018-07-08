require './lib/cell-checkers/grid_boundary_checker.rb'

class Cell
  def initialize(board_array:, position:)
    @board_array = board_array
    @position = position
    @original_position = position
    @character = board_array[position]
    @board_width = Math.sqrt(@board_array.length.to_i).to_i
    @boundary_checker = GridBoundaryChecker.new(board_width: @board_width, position: @position)
  end

  private

  def check_range(start:, end_condition:, incrementer:)
    counter = start

    while end_condition.call(counter) do
      current_cell = @board_array[counter]

      break if current_cell != @character

      counter = incrementer.call(counter)
    end

    current_cell == @character ? true : false
  end

  def top_diagonal_win?
    incrementer = lambda { |counter| counter += @board_width - 1 }
    end_condition = lambda { |counter| counter <= bottom_left_cell_position }

    check_range(start: @board_width - 1, end_condition: end_condition, incrementer: incrementer)
  end

  def bottom_diagonal_win?
    incrementer = lambda { |counter| counter += @board_width + 1 }
    end_condition = lambda { |counter| counter <= @board_array.length - 1 }

    check_range(start: 0, end_condition: end_condition, incrementer: incrementer)
  end

  def vertical_win?
    boundary_checker = GridBoundaryChecker.new(board_width: @board_width, position: @position)
    @top_boundary = boundary_checker.top_boundary
    @bottom_boundary = boundary_checker.bottom_boundary

    incrementer = lambda { |counter| counter += @board_width }
    end_condition = lambda { |counter| counter <= @bottom_boundary }

    check_range(start: @top_boundary, end_condition: end_condition, incrementer: incrementer)
  end

  def horizontal_win?
    @left_boundary = GridBoundaryChecker.new(board_width: @board_width, position: @position).left_boundary
    incrementer = lambda { |counter| counter += 1 }
    end_condition = lambda { |counter| counter <= @left_boundary + @board_width - 1}

    check_range(start: @left_boundary, end_condition: end_condition, incrementer: incrementer)
  end

  def bottom_left_cell_position
    @board_array.length - @board_width
  end
end
