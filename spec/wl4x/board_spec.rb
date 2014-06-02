require 'spec_helper'

describe Board do
  before (:all) do
    @board = Board.new
  end
  
  describe '#initialize' do
    it 'adds system markers where there are no homeworlds' do
      (@board.height-1).times do |row|
        (@board.width-1).times do |col|
          if !(row.odd? and col == @board.width-1)
            if @board.get_hex(row, col)[0].class != Homeworld
              @board.get_hex(row, col)[0].should be_a(SystemMarker)
            end
          end
        end
      end
    end
  end
  
  describe '#get_hex' do
    it 'returns array of counters in given hex' do
      (@board.height-1).times do |row|
        (@board.width-1).times do |col|
          if !(row.odd? and col == @board.width-1)
            hex = @board.get_hex(row, col)
           
            hex.should be_a(Array)
            
            hex.each do |piece|
              piece.row.should eql(row)
              piece.col.should eql(col)
            end
          end
        end
      end
    end
    
    it 'should throw error if hex is not on board' do
      width  = @board.width
      height = @board.height
      
      expect { @board.get_hex(0, width) }.to raise_error(ArgumentError)
      expect { @board.get_hex(height, 0) }.to raise_error(ArgumentError)
      expect { @board.get_hex(-1, 0) }.to raise_error(ArgumentError)
      expect { @board.get_hex(0, -1) }.to raise_error(ArgumentError)
      expect { @board.get_hex(-1, -1) }.to raise_error(ArgumentError)
      expect { @board.get_hex(0, width) }.to raise_error(ArgumentError)
      expect { @board.get_hex(height, -1) }.to raise_error(ArgumentError)
      expect { @board.get_hex(height, width) }.to raise_error(ArgumentError)
    end
    
    it 'should have width-1 columns in odd numbered rows' do
      width  = @board.width
      height = @board.height
      
      (1..height).step(2).each do |row|
        expect { @board.get_hex(row, width-1) }.to raise_error(ArgumentError)
      end
    end
  end
end