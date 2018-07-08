require './lib/cell-checkers/cell.rb'

class CenterCell < Cell
  def won?
    return true if diagonal_win?
    return true if horizontal_win?
    return true if vertical_win?

    false
  end

  private

  def diagonal_win?
    return true if top_diagonal_win?
    return true if bottom_diagonal_win?
  end
end
