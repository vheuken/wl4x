HEX_MAP_WIDTH  = 13
HEX_MAP_HEIGHT = 12

class Board
  attr_reader :height, :width
  
  def initialize
    @height = HEX_MAP_HEIGHT
    @width  = HEX_MAP_WIDTH
    
    @playing_pieces = Array.new
    
    initialize_system_markers
  end
  
  def get_hex(row, col)
    if !valid_coordinates?(row, col) then
      raise ArgumentError.new("Invalid coordinates!")
    end
    
    hex = []
    
    @playing_pieces.each do |piece|
      if (piece.row == row) and (piece.col == col) then
        hex.push(piece)
      end
    end
    
    hex
  end
  
private 
  def valid_coordinates?(row, col)
    if (row.odd? and col == @width-1) then
      return false
    elsif (row < 0) or (col < 0) then
      return false
    elsif (row < @height) and (col < @width) then
      return true
    end
    
    false
  end
  
  def initialize_system_markers
    for row in 0..@height-1 do
      for col in 0..@width-1 do
        if !(row.odd? and col == @width-1) then
          if get_hex(row, col).empty? then
            @playing_pieces.push(SystemMarker.new(row, col))
          end
        end
      end
    end
  end
end