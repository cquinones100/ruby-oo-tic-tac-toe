require './lib/player/human_player.rb'
require './lib/board.rb'
require './lib/user_input_handler.rb'

RSpec.describe 'Human Player' do
  describe 'when playing a turn' do
    it 'prompts the user for a move' do
      allow_any_instance_of(UserInputHandler).to receive(:gets).and_return('1')

      player = HumanPlayer.new(character: 'X')
      board = Board.new(size: 3)

      expect{ player.play_turn(board_array: board.board_array) }
        .to output(/Enter a cell number (1 - 9)/)
        .to_stdout
    end
  end
end
