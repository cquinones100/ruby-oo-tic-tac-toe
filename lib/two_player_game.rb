require './lib/game.rb'
require './lib/player/human_player.rb'

class TwoPlayerGame < Game
  attr_reader :player_x, :player_o

  def initialize(*args)
    super

    @player_x = HumanPlayer.new(character: 'X')
    @player_o = HumanPlayer.new(character: 'O')
    @current_player = @player_x

    play_round
  end
end
