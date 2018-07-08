require './lib/board.rb'
RSpec.describe 'Board' do
  it 'initializes with a board based on its size' do
    board = Board.new(size: 3)

    expect(board.board_array.length).to eq(9)

    board = Board.new(size: 4)

    expect(board.board_array.length).to eq(16)
  end

  it 'displays its board to the console' do

    board = Board.new(size: 3)
    expect { board.display} 
      .to output("   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n").to_stdout
  end
end
