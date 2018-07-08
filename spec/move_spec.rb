require './lib/move.rb'

RSpec.describe 'Move' do
  describe 'validation' do
    board_array = [
      nil, 'O', nil, 
      nil, nil, nil,
      nil, nil, nil
    ]

    it 'does not allow a move to be placed on an occupied position' do
      move = Move.new(board_array: board_array, move: '2')

      expect(move.valid?).to eq(false)
    end

    it 'does not allow a move to be placed out of bounds' do
      move = Move.new(board_array: board_array, move: '10')
      expect(move.valid?).to eq(false)

      move = Move.new(board_array: board_array, move: '-1')
      expect(move.valid?).to eq(false)
    end

    it 'allows a legal move' do
      move = Move.new(board_array: board_array, move: '1')
      expect(move.valid?).to eq(true)
    end
  end
end
