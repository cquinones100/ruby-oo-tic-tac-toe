require './spec/spec_helper.rb'
require './lib/cell-checkers/center_cell.rb'

RSpec.describe 'center cell' do
  describe 'when there is a diagonal win' do
    it 'returns true for won?' do
      board_array = [
        'O', 'O', 'X',
        nil, 'X', 'O',
        'X', nil, 'X',
      ]

      cell = CenterCell.new(board_array: board_array, position: 4)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'O', 'X',
        nil, 'X', 'O',
        'O', nil, 'X',
      ]

      cell = CenterCell.new(board_array: board_array, position: 4)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'O', 'X', 'X', 'X',
        nil, 'X', 'X', 'X', nil,
        'O', 'X', 'X', nil, nil,
        'X', 'X', 'X', nil, nil,
        'X', nil, 'X', nil, nil
      ]

      cell = CenterCell.new(board_array: board_array, position: 12)

      expect(cell.won?).to eq(true)
    end
  end

  describe 'when there is a horizontal win' do
    it 'returns true for won?' do
      board_array = [
        'O', 'O', 'X',
        'X', 'X', 'X',
        'O', nil, 'O',
      ]

      cell = CenterCell.new(board_array: board_array, position: 4)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'O', 'O', 'X', 'X',
        nil, 'X', 'X', 'X', nil,
        'X', 'X', 'X', 'X', 'X',
        'X', 'O', 'X', nil, nil,
        'X', nil, 'X', nil, nil
      ]

      cell = CenterCell.new(board_array: board_array, position: 12)

      expect(cell.won?).to eq(true)
    end
  end

  describe 'when there is a vertical win' do
    it 'returns true for won?' do
      board_array = [
        'O', 'X', 'X',
        'X', 'X', 'O',
        'O', 'X', 'O',
      ]

      cell = CenterCell.new(board_array: board_array, position: 4)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'O', 'X', 'X', 'X',
        nil, 'X', 'X', 'X', nil,
        'X', 'X', 'X', 'O', 'X',
        'X', 'O', 'X', nil, nil,
        'X', nil, 'X', nil, nil
      ]

      cell = CenterCell.new(board_array: board_array, position: 12)

      expect(cell.won?).to eq(true)
    end
  end
end
