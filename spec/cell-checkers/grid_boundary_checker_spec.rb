require './spec/spec_helper.rb'
require './lib/cell-checkers/grid_boundary_checker.rb'

RSpec.describe 'Grid Boundary Checker' do
  describe 'when finding the top boundary' do
    it 'returns the top boundary' do
      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 2
        ).top_boundary
      )
        .to eq(2) 

      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 4
        ).top_boundary
      )
        .to eq(1) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 7
        ).top_boundary
      )
        .to eq(3) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 4
        ).top_boundary
      )
        .to eq(0) 
    end
  end

  describe 'when finding the bottom boundary' do
    it 'returns the bottom bondary' do
      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 1
        ).bottom_boundary
      )
        .to eq(7) 

      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 4
        ).bottom_boundary
      )
        .to eq(7) 

      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 3
        ).bottom_boundary
      )
        .to eq(6) 

      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 6
        ).bottom_boundary
      )
        .to eq(6) 

      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 8
        ).bottom_boundary
      )
        .to eq(8) 
    end
  end

  describe 'when finding the left boundary' do
    it 'returns the left boundary' do
      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 5
        ).left_boundary
      )
        .to eq(3) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 8
        ).left_boundary
      )
        .to eq(8) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 7
        ).left_boundary
      )
        .to eq(4) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 2
        ).left_boundary
      )
        .to eq(0) 
    end

    it 'returns the right boundary' do
      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 4
        ).right_boundary
      )
        .to eq(5) 

      expect(
        GridBoundaryChecker.new(
          board_width: 3, 
          position: 3
        ).right_boundary
      )
        .to eq(5) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 7
        ).right_boundary
      )
        .to eq(7) 

      expect(
        GridBoundaryChecker.new(
          board_width: 4, 
          position: 2
        ).left_boundary
      )
        .to eq(0) 
    end
  end
end
