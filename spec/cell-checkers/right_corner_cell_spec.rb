require './spec/spec_helper.rb'
require './lib/cell-checkers/right_corner_cell.rb'

RSpec.describe 'right corner cell' do
  describe 'when there is no win' do
    it 'returns false for won?' do
      board_array = [
        'O', 'O', 'X',
        nil, 'O', 'O',
        'X', nil, 'X',
      ]

      cell = RightCornerCell.new(board_array: board_array, position: 2)

      expect(cell.won?).to eq(false)

      cell = RightCornerCell.new(board_array: board_array, position: 8)

      expect(cell.won?).to eq(false)
    end
  end

  describe 'when there is a vertical win' do
    it 'returns true for won?' do
      board_array = [
        'O', 'O', 'X',
        nil, 'O', 'X',
        'X', nil, 'X',
      ]

      cell = RightCornerCell.new(board_array: board_array, position: 2)

      expect(cell.won?).to eq(true)

      cell = RightCornerCell.new(board_array: board_array, position: 8)

      expect(cell.won?).to eq(true)

      board_array = [
        'O', 'O', 'X', 'X',
        'O', 'O', 'O', 'X',
        nil, 'X', nil, 'X',
        'X', nil, nil, 'X'
      ]

      cell = RightCornerCell.new(board_array: board_array, position: 3)

      expect(cell.won?).to eq(true)
    end
  end

  describe 'when there is a horizontal win' do
    it 'returns true for won?' do
      board_array = [
        'X', 'X', 'X',
        nil, 'O', 'X',
        'X', nil, nil,
      ]

      cell = RightCornerCell.new(board_array: board_array, position: 2)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'X', 'X', 'X',
        'O', 'O', 'O', 'X',
        nil, 'X', nil, 'X',
        'X', nil, nil, nil
      ]

      cell = RightCornerCell.new(board_array: board_array, position: 3)

      expect(cell.won?).to eq(true)
    end
  end

  describe 'when the the cell is at the top' do
    describe 'when there is a diagonal win' do
      it 'returns true for won?' do
        board_array = [
          'O', 'O', 'X',
          nil, 'X', nil,
          'X', nil, nil
        ]

        cell = RightCornerCell.new(board_array: board_array, position: 2)

        expect(cell.won?).to eq(true)

        board_array = [
          'O', 'O', 'X', 'X',
          'O', 'O', 'X', nil,
          nil, 'X', nil, nil,
          'X', nil, nil, nil
        ]

        cell = RightCornerCell.new(board_array: board_array, position: 3)

        expect(cell.won?).to eq(true)
      end
    end
  end

  describe 'when the cells is at the bottom' do
    describe 'when there is a diagonal win' do
      it 'returns true for won?' do
        board_array = [
          'X', 'O', 'X',
          nil, 'X', 'O',
          nil, nil, 'X'
        ]

        cell = RightCornerCell.new(board_array: board_array, position: 8)

        expect(cell.won?).to eq(true)

        board_array = [
          'X', 'O', 'O', 'O',
          'O', 'X', 'X', nil,
          nil, 'X', 'X', nil,
          'X', nil, nil, 'X'
        ]

        cell = RightCornerCell.new(board_array: board_array, position: 15)

        expect(cell.won?).to eq(true)
      end
    end

  end
end
