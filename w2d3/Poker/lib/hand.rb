require "card"

class Hand

  attr_reader :hand, :hand_values

  def initialize(hand)
    raise "Invalid hand" unless hand.length == 5
    @hand = hand
    @hand_values = nil
  end

  def check_hand

    result = ["HH"]
    card_values = Hash.new {|h, k| h[k] = 0 }
    @hand.each { |card| card_values[card.value.to_i] += 1}
    @hand_values = card_values
    suits = Hash.new { |h, k| h[k] = 0 }
    @hand.each { |card| suits[card.suit] += 1}
    result << "1P" if card_values.values.any? { |v| v > 1 }
    result << "2P" if card_values.values.count { |v| v > 1 } > 1
    result << "3K" if card_values.values.any? { |v| v > 2 }
    sorted_keys = card_values.keys.sort
    result << "S" if sorted_keys == (sorted_keys.first..sorted_keys.last).to_a
    result << "F" if suits.values.include?(5)
    result << "FH" if card_values.values.count(2) == 1 && card_values.values.count(3) == 1
    result << "4K" if card_values.values.any? { |v| v > 3 }
    if result.include?("S")
      if suits.include?("F")
        result << "SF"
        result << "RF" if sorted_keys.first == 10
      end
    end
    result.last
  end

  HAND_RANKS = [
    "HH",
    "1P",
    "2P",
    "3K",
    "S",
    "F",
    "FH",
    "4K",
    "SF",
    "RF"
  ]

  def rank_hand(hand2)

    hand1_rank = HAND_RANKS.index(self.check_hand)
    hand2_rank = HAND_RANKS.index(hand2.check_hand)

    if hand1_rank == hand2_rank
      tie_breaker(self, hand2)
    else
      return hand1_rank > hand2_rank ? self : hand2
    end

  end

  def tie_breaker(hand1, hand2)

    hand_type = hand1.check_hand

    if hand_type == "S" || hand_type == "SF"
      case hand1.hand_values.keys.max <=> hand2.hand_values.keys.max
      when 1
        return hand1
      when -1
        return hand2
      end
    else
     #more logic here !!!!
    end
  end

end
