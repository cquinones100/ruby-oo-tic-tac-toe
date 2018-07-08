class GameBuilder
  attr_accessor :game

  def initialize(number_of_players:, board:)
    @number_of_players = number_of_players.to_i
    @board = board
  end

  def build_game
    require './lib/two_player_game.rb'
    require './lib/one_player_game.rb'
    @game = Object.const_get("#{number_of_players_to_word}PlayerGame").new(board: @board)
  end

  private

  def number_of_players_to_word
    arr = ['Zero', 'One', 'Two']

    arr[@number_of_players]
  end
end
