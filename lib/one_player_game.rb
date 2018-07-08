require './lib/game.rb'
require './lib/player/human_player.rb'
require './lib/player/computer_player.rb'
require './lib/user_input_handler'

class OnePlayerGame < Game
  attr_reader :player_x, :player_o

  def initialize(*args)
    super

    create_players(get_player_character_from_user)

    @current_player = @player_x

    play_round
  end

  private

  def create_players(user_selection)
    if user_selection == '1'
      @player_x = HumanPlayer.new(character: 'X')
      @player_o = ComputerPlayer.new(character: 'O')
    else
      @player_x = ComputerPlayer.new(character: 'X')
      @player_o = HumanPlayer.new(character: 'O')
    end
  end

  def build_player(klass, character)
    self.instance_variable_set(
      "@player_#{character}", 
      klass.new(character: character)
    )
  end

  def get_player_character_from_user
    prompt = lambda do
      puts 'Which character would you like to be?'
      puts '1. X'
      puts '2. O'
    end

    UserInputHandler.new(type: :number, prompt: prompt).input
  end
end
