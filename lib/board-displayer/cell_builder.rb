class CellBuilder
  attr_reader :cell

  def initialize(character:, board_size:, index:)
    @character = character || ' '
    @board_size = board_size.to_i
    @board_length = (board_size**2).to_i
    @index = index
  end

  def cell
    build_cell
  end

  private

  def build_cell
    cell_leader + cell_rider
  end

  def cell_leader
    " #{@character} "
  end

  def cell_rider
    return "" if cell_is_at_the_end?
    return horizontal_line if cell_is_at_edge?

    '|'
  end

  def cell_is_at_the_end?
    @index == (@board_length -1)
  end

  def horizontal_line
    line = "\n"
    ((@board_size.to_i * 4) - 1).times do
      line += '-'
    end
    line + "\n"
  end

  def cell_is_at_edge?
    return false if @index == (@board_length -1)
    return false if @index == 0
    return false if @index < @board_size -1
    (@index + 1) % @board_size == 0
  end
end
