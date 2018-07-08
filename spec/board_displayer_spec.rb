require './lib/board-displayer/board_displayer.rb'

RSpec.describe 'Board Displayer' do
  it 'prints a string representation of a board' do
    board_array = ['X', nil, 'O', nil, 'X', nil, nil, nil, nil]
    displayer = BoardDisplayer.new(board_array: board_array)

    expect { displayer.display }
      .to output(" X |   | O \n-----------\n   | X |   \n-----------\n   |   |   \n")
      .to_stdout
  end
end
