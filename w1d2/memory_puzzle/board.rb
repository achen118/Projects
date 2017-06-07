require_relative 'card'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(2) { Array.new(9) }
    populate
  end

  def populate
    values = ((1..9).to_a * 2).shuffle
    (0...2).each do |i|
      (0...9).each do |j|
        @grid[i][j] = Card.new(values.pop)
      end
    end
  end

  def render
    (1..9).each {|num| print " #{num}" }
    print "\n"
    @grid.each_with_index do |row, i|
      print "#{i+1}"
      row.each do |el|
        if el.display
          print "#{el.to_s} "
        else
          print "- "
        end
      end
      print "\n"
    end
  end

  def won?
    @grid.each do |row|
      return true if row.all? {|el| el.display }
    end
    false

  end

  def reveal(guessed_pos, prev = nil)
    card = self[guessed_pos]
    if guessed_pos == prev
      puts "Invalid guess!"
    else
      card.reveal
      return card.face_value
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

end
