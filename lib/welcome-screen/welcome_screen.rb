require './lib/user_input_handler.rb'
require './lib/game_builder.rb'
require './lib/board'

class WelcomeScreen 
  def run
    welcome

    GameBuilder.new(
      number_of_players: get_number_of_players_from_user,
      board: Board.new(size: get_board_size_from_user)
    ).build_game
  end

  private

  def get_game_board_size_response
    puts 'Enter a Game Size'
  end

  def welcome
    puts 'Welcome to Tic Tac Toe!'
  end

  def get_number_of_players_from_user
    prompt = lambda do 
      puts 'Choose A Game Type'
      puts '1. One Player'
      puts '2. Two Player'
    end

    UserInputHandler.new(type: :number, prompt: prompt).input
  end

  def get_board_size_from_user
    prompt = lambda do
      puts 'Enter a number for the board size'
    end

    UserInputHandler.new(type: :number, prompt: prompt).input.to_i
  end
end
