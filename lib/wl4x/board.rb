HEX_MAP_WIDTH  = 13
HEX_MAP_HEIGHT = 12

class Board
  attr_reader :height, :width
  
  def initialize
    @height = HEX_MAP_HEIGHT
    @width  = HEX_MAP_WIDTH
    
    @playing_pieces = []
    
    initialize_system_markers
  end
  
  def get_hex(row, col)
    if !valid_coordinates?(row, col)
      raise ArgumentError.new("Invalid coordinates!")
    end
    
    @playing_pieces.uniq do |piece|
      piece.row == row and piece.col == col
    end
  end
  
private 
  def valid_coordinates?(row, col)
    if row.odd? and col == @width-1
      return false
    elsif row < 0 or col < 0
      return false
    elsif row < @height and col < @width
      return true
    end
    
    false
  end
  
  def initialize_system_markers
    @height-1.times do |row|
      @width-1.times do |col|
        if !(row.odd? and col == @width-1)
          if get_hex(row, col).empty?
            @playing_pieces.push(SystemMarker.new(row, col))
          end
        end
      end
    end
  end
end