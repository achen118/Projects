class Player

  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def guess
    puts "Letter, please"
    letter = gets.chomp
    letter
  end

  def alert_invalid_guess
    puts "Invalid guess"
  end
end
