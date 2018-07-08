require './lib/board-displayer/cell_builder.rb'

RSpec.describe 'Cell Builder' do
  it 'builds a X cell' do
    expect(CellBuilder.new(character: 'X', board_size: 3, index: 0).cell)
      .to eq(" X |")
  end

  it 'builds a Y cell' do
    expect(CellBuilder.new(character: 'Y', board_size: 3, index: 0).cell)
      .to eq(" Y |")
  end

  describe 'when a cell is on the edge' do
    it 'builds a X cell with edge and next line' do
      expect(CellBuilder.new(character: 'X', board_size: 3, index: 2).cell)
        .to eq(" X \n-----------\n")
    end

    it 'builds a Y cell with edge and next line' do
      expect(CellBuilder.new(character: 'Y', board_size: 3, index: 2).cell)
        .to eq(" Y \n-----------\n")
    end

    it 'builds a blank cell with edge and next line' do
      expect(CellBuilder.new(character: nil, board_size: 3, index: 2).cell)
        .to eq("   \n-----------\n")
    end

    describe 'when the cell is at the end of the board' do
      it 'returns the end cell' do
        expect(CellBuilder.new(character: nil, board_size: 3, index: 8).cell)
          .to eq("   ")
      end
    end
  end
end
