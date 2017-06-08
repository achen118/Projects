class TowersOfHanoi

  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [], []]
  end

  def get_move
    puts "Where do you want to move from?"
    move_from = gets.chomp.to_i
    puts "Where do you want to move to?"
    move_to = gets.chomp.to_i
    [move_from, move_to]
  end

  def move(arr)
    @board[arr[1]].unshift(@board[arr[0]].shift)
  end

  def valid_move?(arr)
    return false unless arr[0].between?(0, 2) || arr[1].between?(0, 2)
    return false if @board[arr[0]].empty?
    return true if @board[arr[1]].empty?
    return false if @board[arr[0]].first > @board[arr[1]].first
    true
  end

  def play
    until won?
      p @board
      arr = get_move
      move(arr) if valid_move?(arr)
    end
  end

  def won?
    return true if @board == [[], [1, 2, 3], []] || @board == [[], [], [1, 2, 3]]
    false
  end

end

game = TowersOfHanoi.new
game.play
