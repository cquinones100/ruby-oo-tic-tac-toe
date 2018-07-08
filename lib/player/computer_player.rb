require './lib/player/player.rb'

class ComputerPlayer < Player
  def play_turn(board_array:)
    empty_indexes = board_array.each.with_index.reduce([]) do |acc, (curr, index)|
      acc.push(index) if curr.nil?
      acc
    end

    empty_indexes.sample.to_s
  end
end
