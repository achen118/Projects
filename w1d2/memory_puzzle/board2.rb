require_relative 'card'

class Board

  attr_reader :grid

  def initialize
    @grid = []
  end

  def populate
    puts "How many rows would you like?"
    row_count = gets.chomp
    puts "How many columns would you like?"
    col_count = gets.chomp
    total_cards = row_count.to_i * col_count.to_i


  end

  def get_random_rows(row_count, total_cards)
    pair_count = Hash.new { |k, v| k[v] = 0 }
    row_count.times do
      row = []
      until row.length == row_count.to_i do
        rand_num = rand(1..total_cards)
        if pair_count[rand_num] < 2
          row << rand_num
          pair_count[rand_num] += 1
        else
          rand_num = rand(1..total_cards)
        end
        p pair_count
      end
      @grid << row
    end
    p @grid
  end

  def render

  end

  def won?

  end

  def reveal

  end

end

new_board = Board.new
new_board.get_random_rows(4, 16)
