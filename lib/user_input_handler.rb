class UserInputHandler
  class NumberExpectedError < StandardError
    def initialize(message)
      puts message
    end
  end

  class ValidatorNotEnteredError < StandardError; end

  attr_accessor :input

  def initialize(type: nil, regex: nil, prompt:)
    @type = type
    @regex = regex
    @prompt = prompt
  end

  def input
    @input ||= prompt_user_for_input
  end

  private

  def prompt_user_for_input
    ARGV.clear
    @prompt.call
    @entered_input = gets.chomp
    validate_input
  end

  def validate_input
    return self.send("validate_#{@type}") if @type
    return self.send("validate_regex", @regex) if @regex

    raise ValidatorNotEnteredError if !@type && !@regex
  end

  def validate_number
    begin
      raise NumberExpectedError, "\nPlease enter a number\n\n" if (@entered_input =~ /\d+/).nil?
    rescue NumberExpectedError
      prompt_user_for_input
    end

    @entered_input
  end
end
