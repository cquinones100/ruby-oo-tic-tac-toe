class GridBoundaryChecker
  def initialize(board_width:, position:)
    @board_width = board_width
    @position = position + 1
    @board_length = @board_width**2
  end

  def left_boundary
    return 0 if @position < @board_width
    return @position - @board_width if @position % @board_width == 0

    @position - (@position % @board_width - 1) - 1
  end

  def right_boundary
    return @position - 1 if @position % @board_width == 0
    @position + (@board_width - (@position % @board_width)) - 1
  end

  def top_boundary
    return @position - 1 if @position - 1 < @board_width
    return @board_width - 1 if @position % @board_width == 0
    @position % @board_width - 1
  end

  def bottom_boundary
    return @board_length - 1 if @position % @board_width == 0
    if @position - 1 < @board_width
      diff = @position - 1 
    else
      diff = @position % @board_width - 1
    end

    @board_length - @board_width + diff 
  end
end
