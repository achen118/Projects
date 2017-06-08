require "deck"

describe Deck do

  describe '#initialize' do

    it "initializes a deck object" do
      game = Deck.new(3)
      expect(game.deck).to eq(3)
    end

  end

  describe '::shuffled_deck' do
    subject(:new_deck) { Deck.shuffled_deck }

    it "creates a deck with 52 cards" do
      expect(new_deck.deck.length).to eq(52)
    end

    it "creates a randomized deck" do
      cards = []

      (2..14).each do |value|
        ["H","S","C","D"].each do |suit|
          cards << Card.new(value.to_s, suit)
        end
      end

      expect(new_deck.deck).to_not eq(cards)
    end

    it "contains all cards of 13 values" do
      card_hash = Hash.new(0)
      new_deck.deck.each { |card| card_hash[card.value] += 1 }
      all_values = card_hash.values.all? { |value| value == 4 }
      expect(all_values).to eq(true)
    end

    it "contains all 4 suits for a particular card value" do
      suit_hash = Hash.new(0)
      new_deck.deck.each { |card| suit_hash[card.suit] += 1 }
      all_suits = suit_hash.values.all? { |value| value == 13 }
      expect(all_suits).to eq(true)
    end

  end
end
