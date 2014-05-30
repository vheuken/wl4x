HEX_MAP_WIDTH  = 13
HEX_MAP_HEIGHT = 12

class Board
  attr_reader :height, :width
  
  def initialize
    @height = HEX_MAP_HEIGHT
    @width  = HEX_MAP_WIDTH
  end
  
  def get_hex(row, col)
    if !validCoordinates?(row, col) then
      raise ArgumentError.new("Invalid coordinates!")
    end
    
    []
  end
  
private 
  def validCoordinates?(row, col)
    if (row.odd? and col == @width-1) then
      return false
    elsif (col < @width) and (row < @height) then
      return true
    end
    
    false
  end
end