require './spec/spec_helper.rb'
require './lib/game.rb'
require './lib/player/player.rb'
require './lib/player/human_player.rb'
require './lib/two_player_game.rb'

RSpec.describe 'Two Player Game' do
  describe 'on init' do
    before(:each) do
      allow_any_instance_of(UserInputHandler).to receive(:gets).and_return('1')
    end

    it 'prints the welcome message on init' do
      allow_any_instance_of(TwoPlayerGame).to receive(:play_round)

      expect { create_two_player_game } 
        .to output(/Two Player Game Selected/)
        .to_stdout
    end

    xit 'creates both players' do
      game = create_two_player_game
      expect(game.player_x).to be_an_instance_of(HumanPlayer)
      expect(game.player_o).to be_an_instance_of(HumanPlayer)
    end

    xit 'displays the game board' do
      expect { create_two_player_game }
        .to output(/   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n/).to_stdout
        .to_stdout
    end

    xit 'starts round 1' do
      expect { create_two_player_game }
        .to output(/Round 1/)
        .to_stdout

      expect { create_two_player_game }
        .to output(/X's Turn!/)
        .to_stdout

      expect { create_two_player_game }
        .to output(/Enter a cell number (1 - 9)/)
        .to_stdout
    end
  end

  def create_two_player_game
    board = Board.new(size: 3)
    TwoPlayerGame.new(board: board)
  end
end
