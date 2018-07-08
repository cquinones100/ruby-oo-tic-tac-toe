require './lib/cell-checkers/cell.rb'

class OtherCell < Cell
  def won?
    return true if horizontal_win?
    return true if vertical_win?

    false
  end
end
