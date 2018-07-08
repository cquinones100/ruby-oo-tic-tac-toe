class Move
  attr_reader :position

  def initialize(board_array:, move:)
    @board_array = board_array
    @move = move
    @position = move.to_i - 1
  end

  def valid?
    return false if position_occupied?
    return false if out_of_bounds?

    true
  end

  private

  def out_of_bounds?
    @position > @board_array.length - 1 || @position < 0
  end

  def position_occupied?
    !@board_array[@position].nil?  
  end
end
