require './lib/player/player.rb'
require './lib/user_input_handler.rb'

class HumanPlayer < Player
  def play_turn(board_array:)
    prompt = lambda { puts "Enter a cell number 1 - #{board_array.length}" }
    UserInputHandler.new(type: :number, prompt: prompt).input
  end
end
