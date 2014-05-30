require 'spec_helper'

describe Board do
  before (:all) do
    @board = Board.new
  end
  
  describe '#initialize' do
    pending 'adds homeworlds to board' do

    end
    
    it 'adds system markers where there are no homeworlds' do
      for row in 0..@board.height-1 do
        for col in 0..@board.width-1 do
          if !(row.odd? and col == @board.width-1) then
           if @board.get_hex(row, col)[0].class != Homeworld then
             @board.get_hex(row, col)[0].should be_a(SystemMarker)
           end
          end
        end
      end
    end
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
      width  = @board.width
      height = @board.height
      
      expect { @board.get_hex(0, width) }.to raise_error(ArgumentError)
      expect { @board.get_hex(height, 0) }.to raise_error(ArgumentError)
      expect { @board.get_hex(height, width) }.to raise_error(ArgumentError)
      expect { @board.get_hex(1, width-1) }.to raise_error(ArgumentError)
      expect { @board.get_hex(-1, 0) }.to raise_error(ArgumentError)
      expect { @board.get_hex(0, -1) }.to raise_error(ArgumentError)
      expect { @board.get_hex(-1, -1) }.to raise_error(ArgumentError)
      expect { @board.get_hex(0, width) }.to raise_error(ArgumentError)
      expect { @board.get_hex(height, -1) }.to raise_error(ArgumentError)
    end
  end
end