require './lib/cell-checkers/cell_factory.rb'
class Judge
  attr_accessor :tie, :won

  def initialize(board_array:, position:, round:)
    @board_array = board_array
    @board_width = Math.sqrt(board_array.length)
    @position = position
    @counter = 0
    @round = round
  end

  def game_is_over?
    return true if winner?
    return true if all_spaces_occupied?
    false
  end

  def won
    game_is_over?
  end

  private

  def winner?
    cell = CellFactory.new(
      position: @position, 
      board_array: @board_array
    ).cell

    return false if !cell

    if cell.won?
      self.won = true
      return true
    end

    false
  end

  def all_spaces_occupied?
    if @round == @board_array.length
      self.tie = true
      return true
    end

    false
  end
end
