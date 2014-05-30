require 'spec_helper'

describe Board do
  before (:all) do
    @board = Board.new
  end
  
  describe '#get_hex' do
    it 'return array of counters in given hex' do
      for row in 0..@board.height-1 do
        for col in 0..@board.width-1 do
          if !(row.odd? and col == @board.width-1) then
           @board.get_hex(row, col).should be_a(Array)
          end
        end
      end
    end
    
    it 'should throw error if hex is not on board' do
      expect { @board.get_hex(0, @board.width) }.to raise_error
      expect { @board.get_hex(@board.height, 0) }.to raise_error
      expect { @board.get_hex(@board.height, @board.width) }.to raise_error
      expect { @board.get_hex(1, @board.width-1)}.to raise_error
    end
  end
end