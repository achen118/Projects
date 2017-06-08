require "card"

class Deck
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def self.shuffled_deck
    cards = []

    (2..14).each do |value|
      ["H","S","C","D"].each do |suit|
        cards << Card.new(value.to_s, suit)
      end
    end

    cards.shuffle!

    Deck.new(cards)
  end

end
