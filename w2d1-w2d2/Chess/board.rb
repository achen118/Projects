require_relative 'pieces'
class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate_board
  end

  def populate_board
    new_arr = []
    (0..1).map do |i|
      (0..7).each do |j|
        new_arr << [i, j]
      end
    end
    (6..7).map do |i|
      (0..7).each do |j|
        new_arr << [i, j]
      end
    end
    new_arr.each do |el|
      self[el] = Piece.new
    end
  end

  def move_piece(start_pos, end_pos)
    raise 'No piece at starting position' unless self[start_pos]
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value
  end

end
