require_relative 'tile'
require 'byebug'

class Board

  def initialize
    mines = Array.new(80) { Tile.new true }
    safe = Array.new(1) { Tile.new }
    tiles = (mines + safe).shuffle
    @grid = Array.new(9) { Array.new(9) { tiles.pop } }
  end

  def render
    puts "  #{(0..8).to_a.join(" ")}"
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.map { |tile| tile.to_s }.join(" ")}"
    end
  end

  def won?
    false
  end

  def play
    until won?
      render
      pos = get_position
      action = get_action
      if action == "R"
        self[pos].reveal
      else
        self[pos].flag
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def num_nearby_mines(pos)
    x, y = pos
    num_mines = 0
    (x - 1..x + 1).each do |row|
      (y - 1..y + 1).each do |col|
        num_mines += 1 if self[[row, col]].has_mine?
      end
    end
    num_mines
  end

  def get_position
    puts "Enter coordinates as x,y"
    parse_pos(gets.chomp)
  end

  def get_action
    puts "Enter action: R for Reveal or F for Flag/Unflag"
    gets.chomp
  end

  def parse_pos(pos)
    pos.split(",").map(&:to_i)
  end

end

new_game = Board.new
new_game.play
