require "hand"

describe Hand do
  let(:card1) { double("card1", value: "10", suit: "H") }
  let(:card2) { double("card2", value: "11", suit: "H") }
  let(:card3) { double("card3", value: "12", suit: "H") }
  let(:card4) { double("card4", value: "13", suit: "C") }
  let(:card5) { double("card5", value: "14", suit: "H") }
  let(:card6) { double("card6", value: "10", suit: "D") }
  let(:card7) { double("card7", value: "14", suit: "D") }
  let(:card8) { double("card8", value: "10", suit: "C") }
  let(:card9) { double("card9", value: "4", suit: "H") }
  let(:card10) { double("card10", value: "7", suit: "H") } #for flush
  let(:card11) { double("card11", value: "4", suit: "S") } #for two pair
  let(:card12){  double("card12", value: "9", suit: "S") }

  describe '#initialize' do

    it "raises an error unless 5 cards are pass in" do
      expect { Hand.new([card1, card2, card3, card4]) }.to raise_error("Invalid hand")
    end

  end

  describe '#check_hand' do

    it "correctly identifies one pair in hand" do
      hand = Hand.new([card1, card6, card2, card9, card4])
      expect(hand.check_hand).to eq("1P")
    end

    it "correctly identifies two pair in hand" do
      hand = Hand.new([card1, card6, card5, card7, card9])
      expect(hand.check_hand).to eq("2P")
    end

    it "correctly identifies a straight in hand" do
      hand = Hand.new([card1, card2, card3, card4, card5])
      expect(hand.check_hand).to eq("S")
    end

    it "correctly identifies a flush in hand" do
      hand = Hand.new([card1, card2, card3, card5, card9])
      expect(hand.check_hand).to eq("F")
    end

    it "correctly identifies a full house in hand" do
      hand = Hand.new([card1, card6, card8, card5, card7])
      expect(hand.check_hand).to eq("FH")
    end
  end

  describe '#rank_hand' do

    it "correctly return higher hand if they are not the same type" do
      hand1 = Hand.new([card1, card6, card2, card9, card4])
      hand2 = Hand.new([card1, card6, card5, card7, card9])
      expect(hand1.rank_hand(hand2)).to be(hand2)
    end

    it "calls the helper method if both hands are the same type" do
      hand1 = Hand.new([card1, card6, card2, card9, card4])
      hand2 = Hand.new([card5, card7, card9, card2, card3])
      expect(hand1).to receive(:tie_breaker)
      hand1.rank_hand(hand2)
    end

  end

  describe '#tie_breaker' do

    it "correctly returns the higher flush" do
      hand1 = Hand.new([card1, card2, card3, card5, card9])
      hand2 = Hand.new([card1, card2, card3, card5, card10])
      expect(tie_breaker(hand1, hand2)).to be(hand2)
    end

    it "correctly returns the higher straight" do
      hand1 = Hand.new([card11, card6, card2, card3, card4])
      hand2 = Hand.new([card1, card2, card3, card4, card5])
      expect(tie_breaker(hand1, hand2)).to be(hand2)
    end

    it "correctly returns the higher two pair" do
      hand1 = Hand.new([card1, card8, card5, card7, card4]) #10 10 14 14 13
      hand2 = Hand.new([card9, card11, card1, card8, card2]) #4 4 10 10
      expect(tie_breaker(hand1, hand2)).to be(hand1)
    end

    it "correctly returns the higher one pair" do
      hand1 = Hand.new([card9, card11, card5, card3, card6])#4 4 14 12 10
      hand2 = Hand.new([card1, card8, card9, card10, card3])#10 10 4 7 12
      expect(tie_breaker(hand1, hand2)).to be(hand2)
    end

    it "correctly returns the higher hand when they are both high cards" do
      hand1 = Hand.new([card1, card7, card3, card11, card10])#10 14 12 4 7
      hand1 = Hand.new([card3, card11, card7, card6, card4]) #12 4 14 10 13
      expect(tie_breaker(hand1, hand)).to eq(hand2)
    end

    it "correctly returns the higher two pair if the pairs are the same" do
      hand1 = Hand.new([card1, card8, card5, card7, card4]) #10 10 14 14 13
      hand2 = Hand.new([card1, card8, card5, card7, card9]) #10 10 14 14 4
      expect(tie_breaker(hand1, hand2)).to be(hand1)
    end


  end




end
