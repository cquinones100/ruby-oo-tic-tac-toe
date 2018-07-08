require './spec/spec_helper.rb'
require './lib/game.rb'
require './lib/player/human_player.rb'
require './lib/one_player_game.rb'

RSpec.describe 'One Player Game' do
  describe 'on init' do
    before(:each) do
      allow_any_instance_of(OnePlayerGame).to receive(:play_round)
    end

    it 'should ask the user what character they want to be' do
      allow_any_instance_of(UserInputHandler).to receive(:gets).and_return('1')
      expect { create_one_player_game }
        .to output(/Which character would you like to be?/)
        .to_stdout
    end

    describe 'when the user chooses to be X' do
      it 'should make its player x a human player' do
        allow_any_instance_of(UserInputHandler).to receive(:gets).and_return('1')
        game = create_one_player_game

        expect(game.player_x).to be_an_instance_of(HumanPlayer)
      end
    end

    describe 'when the user chooses to be o' do
      it 'should make its player o a human player' do
        allow_any_instance_of(UserInputHandler).to receive(:gets).and_return('2')
        game = create_one_player_game

        expect(game.player_x).to be_an_instance_of(ComputerPlayer)
      end
    end
  end

  def create_one_player_game
    OnePlayerGame.new(board: Board.new(size: 3)) 
  end
end
