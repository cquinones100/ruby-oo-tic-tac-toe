require './spec/spec_helper.rb'
require './lib/cell-checkers/other_cell.rb'

RSpec.describe 'other cell' do
  describe 'when there is a horizontal win' do
    it 'returns true for won?' do
      board_array = [
        'X', 'X', 'X',
        nil, 'X', 'O',
        'X', nil, 'X',
      ]

      cell = OtherCell.new(board_array: board_array, position: 1)

      expect(cell.won?).to eq(true)
    end
  end

  describe 'when there is a vertical win' do
    it 'returns true for won?' do
      board_array = [
        'X', 'X', 'O',
        nil, 'X', 'O',
        'X', 'X', 'X',
      ]

      cell = OtherCell.new(board_array: board_array, position: 1)

      expect(cell.won?).to eq(true)
    end
  end
end
