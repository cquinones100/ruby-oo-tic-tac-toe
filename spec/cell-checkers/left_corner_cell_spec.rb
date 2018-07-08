require './spec/spec_helper.rb'
require './lib/cell-checkers/left_corner_cell.rb'

RSpec.describe 'left corner cell' do
  describe 'when there is no win' do
    it 'returns false for won?' do
      board_array = [
        'X', 'O', 'X',
        nil, 'O', 'O',
        'X', nil, 'X',
      ]

      cell = LeftCornerCell.new(board_array: board_array, position: 0)

      expect(cell.won?).to eq(false)

      cell = LeftCornerCell.new(board_array: board_array, position: 6)

      expect(cell.won?).to eq(false)
    end
  end

  describe 'when there is a vertical win' do
    it 'returns true for won?' do
      board_array = [
        'X', 'O', 'X',
        'X', 'O', 'O',
        'X', nil, 'X',
      ]

      cell = LeftCornerCell.new(board_array: board_array, position: 0)

      expect(cell.won?).to eq(true)

      cell = LeftCornerCell.new(board_array: board_array, position: 6)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'O', 'X', 'X',
        'X', 'O', 'O', 'X',
        'X', 'X', nil, 'O',
        'X', nil, nil, 'X'
      ]

      cell = LeftCornerCell.new(board_array: board_array, position: 0)

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

      cell = LeftCornerCell.new(board_array: board_array, position: 0)

      expect(cell.won?).to eq(true)

      board_array = [
        'X', 'X', 'X', 'X',
        'O', 'O', 'O', 'X',
        nil, 'X', nil, 'X',
        'X', nil, nil, nil
      ]

      cell = LeftCornerCell.new(board_array: board_array, position: 0)

      expect(cell.won?).to eq(true)
    end
  end

  describe 'when the the cell is at the top' do
    describe 'when there is a diagonal win' do
      it 'returns true for won?' do
        board_array = [
          'X', 'O', 'X',
          nil, 'X', nil,
          'O', nil, 'X'
        ]

        cell = LeftCornerCell.new(board_array: board_array, position: 0)

        expect(cell.won?).to eq(true)

        board_array = [
          'X', 'O', 'X', 'X',
          'O', 'X', 'X', nil,
          nil, 'O', 'X', nil,
          'X', nil, nil, 'X'
        ]

        cell = LeftCornerCell.new(board_array: board_array, position: 0)

        expect(cell.won?).to eq(true)
      end
    end
  end

  describe 'when the cells is at the bottom' do
    describe 'when there is a diagonal win' do
      it 'returns true for won?' do
        board_array = [
          'O', 'O', 'X',
          nil, 'X', 'O',
          'X', nil, 'X'
        ]

        cell = LeftCornerCell.new(board_array: board_array, position: 6)

        expect(cell.won?).to eq(true)

        board_array = [
          'X', 'O', 'O', 'X',
          'O', 'X', 'X', nil,
          nil, 'X', 'X', nil,
          'X', nil, nil, 'O'
        ]

        cell = LeftCornerCell.new(board_array: board_array, position: 12)

        expect(cell.won?).to eq(true)
      end
    end

  end
end
