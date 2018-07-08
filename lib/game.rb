require './lib/board.rb'
require './lib/move.rb'
require './lib/judge.rb'
require './lib/user_input_handler.rb'
require './lib/welcome-screen/welcome_screen.rb'

class Game
  attr_accessor :round
  attr_reader :board, :current_player, :game

  def initialize(board:)
    @board = board
    @round = 1

    print_welcome_message
  end

  def current_player
    @round % 2 == 0 ? @player_o : @player_x
  end

  def play_round
    display_board
    puts "Round #{@round}"
    puts "#{current_player.character}'s Turn!"

    @move = Move.new(
      board_array: @board.board_array, 
      move: current_player.play_turn(board_array: @board.board_array)
    )

    if @move.valid?
      board.update(character: current_player.character, move: @move.position)

      return end_game if game_is_over?

      play_next_round
    else
      play_round
    end
  end

  private 

  def play_next_round
    self.round = @round + 1
    play_round
  end

  def character_from_selection(selection)
    selection == '1' ? 'X' : 'O'
  end

  def print_welcome_message
    puts "#{class_name_to_string} Selected"
  end

  def class_name_to_string
    self.class.to_s.gsub(/[A-Z]/).with_index { |letter, index| index != 0 ? ' ' + letter : letter }
  end

  def display_board
    self.board.display
  end

  def there_is_a_winner
    @judge.won
  end

  def end_game
    display_board
    puts 'Game Over!'
    if there_is_a_winner
      puts "#{current_player.character} wins!"
    else
      put "there was tie!"
    end

    play_again
  end

  def play_again
    prompt = lambda do
      puts 'Would you like to play again?'
      puts '1. Yes'
      puts '2. No'
    end
    play_again = UserInputHandler.new(type: :number, prompt: prompt).input
    if play_again == '1'
      WelcomeScreen.new.run
    else
      puts 'Goodbye!'
    end

  end

  def game_is_over?
    @judge = Judge.new(
      board_array: @board.board_array, 
      position: @move.position,
      round: @round
    )
    @judge.game_is_over?
  end
end
