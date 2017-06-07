require_relative 'player.rb'

class Game

  attr_reader :players, :dictionary
  attr_accessor :player_index, :fragment, :losses

  def initialize(options = {})
    @fragment = ""
    @players = options[:players]
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)
    @player_index = 0
    @losses = {
      players[0] => 0,
      players[1] => 0
    }
  end

  def play_round
    while !game_over?
      puts "Current Player: #{current_player.name}"
      take_turn(current_player)
      puts "The current fragment: #{fragment}"
      next_player!
    end

    puts "Losing word is #{fragment}"
    losses[player_index] += 1
    puts "Winner is #{current_player.name}"
  end

  def current_player
    current_player = players[player_index]
    current_player
  end

  def previous_player
    if player_index == 0
      player_index = players.length - 1
    else
      player_index -= 1
    end
    previous_player = current_player
  end

  def next_player!
    @player_index = (@player_index + 1) % players.length
    player_index
  end

  def take_turn(player)
    letter = player.guess
    if valid_play?(letter)
      fragment << letter
    else
      player.alert_invalid_guess
      current_player = previous_player
    end
  end

  def valid_play?(string)
    alphabet = ('a'..'z').to_a
    potential_fragment = fragment + string
    spellable = dictionary.select do |entry|
      entry[0...potential_fragment.length] == potential_fragment
    end
    if alphabet.include?(string) && spellable.length > 0
      true
    else
      false
    end
  end

  def game_over?
    return true if dictionary.include?(fragment)
    false
  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Arvind")
  player2 = Player.new("Alice")
  new_game = Game.new({
    players: [player1, player2]
    })

  new_game.play_round
end
