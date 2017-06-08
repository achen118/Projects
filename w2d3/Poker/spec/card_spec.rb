require "card"

describe Card do
  subject(:card) { Card.new("13", "H") }

  describe '#initialize' do
    it "assigns the correct value" do
      expect(card.value).to eq("13")
    end

    it "assigns the correct suit" do
      expect(card.suit).to eq("H")
    end
  end
end
