require_relative 'board'
require_relative 'card'

class Game

  attr_reader :board
  attr_accessor :previous_guess, :idx

  def initialize
    @board = Board.new
    @previous_guess = nil
    @idx = 0
  end

  def play
    p @board.won?
    until @board.won?
      system('clear')
      @board.render
      puts "Choose position (format: x, y)"
      input = gets.chomp.split(", ")
      pos = input.map { |el| el.to_i }
      make_guess(pos)
    end
    puts "You win!"
  end

  def make_guess(pos)
    prev = []
    if idx % 2 == 0
      @board.reveal(pos)
      prev = pos
      idx += 1
    else
      @board.reveal(pos)
      # if same keep
      sleep(3)
      @board[prev].hide
      @board[pos].hide
    end
  end


  #   @board.reveal(pos, @previous_guess)
  #   if @previous_guess.nil?
  #     @previous_guess = pos
  #   else
  #     prev_card_val = @board.reveal(@previous_guess)
  #     curr_card_val = @board.reveal(pos)
  #     if prev_card_val == curr_card_val
  #       sleep(3)
  #       @board[@previous_guess].hide
  #       @board[pos].hide
  #     end
  #     @previous_guess = nil
  #   end
  # end

end

new_game = Game.new
p new_game.play
