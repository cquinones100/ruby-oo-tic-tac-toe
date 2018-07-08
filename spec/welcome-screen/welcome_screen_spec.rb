require './lib/game.rb'

RSpec.describe do
  before(:each) do
    require './lib/user_input_handler.rb'
    allow_any_instance_of(UserInputHandler).to receive(:gets).and_return('1')
    require './lib/one_player_game.rb'
    allow_any_instance_of(OnePlayerGame).to receive(:play_round)
  end

  describe 'presenting the user with a menu' do
    it 'should return the welcome text' do
      expect { WelcomeScreen.new.run }
        .to output(
      /Welcome to Tic Tac Toe!\nChoose A Game Type\n1. One Player\n2. Two Player\n/
      )
        .to_stdout
    end
  end
end
