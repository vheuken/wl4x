require 'spec_helper'

describe Board do
  before (:all) do
    @board = Board.new
  end
  
  describe '#get_hex' do
    it 'return array of counters in given hex' do
      @board.get_hex(0, 0).should be_a(Array)
    end
    
    it 'should throw error if hex is not on board' do
      puts @board.height
      expect { @board.get_hex(0, @board.width) }.to raise_error
      expect { @board.get_hex(@board.height, 0) }.to raise_error
      expect { @board.get_hex(@board.width, @board.height) }.to raise_error
    end
  end
end