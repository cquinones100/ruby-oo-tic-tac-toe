require './lib/user_input_handler.rb'

RSpec.describe 'User Input handler' do
  describe 'on init' do
    it 'prints its prompt' do
      user_input = '1'
      allow_any_instance_of(UserInputHandler)
        .to receive(:gets).and_return(user_input)

      expect { UserInputHandler.new(type: :number, prompt: prompt).input }
        .to output(/Choose a number/)
        .to_stdout
    end
  end

  describe 'when a user enters an allowable string' do
    it 'returns the input' do
      user_input = '1'
      allow_any_instance_of(UserInputHandler)
        .to receive(:gets).and_return(user_input)

      input_handler = UserInputHandler.new(type: :number, prompt: prompt)

      expect(input_handler.input).to eq(user_input)
    end
  end

  xdescribe 'when a user enters a disallowed string' do
    it 'raises an error' do
      user_input = 'dog'

      allow_any_instance_of(UserInputHandler)
        .to receive(:gets).and_return(user_input, '1')

      input_handler = UserInputHandler.new(type: :number, prompt: prompt)

      expect{ input_handler.input }
        .to raise_error(UserInputHandler::NumberExpectedError)
    end
  end

  def prompt
    lambda { puts 'Choose a number' }
  end
end
