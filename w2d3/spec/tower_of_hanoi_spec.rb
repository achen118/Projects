require 'tower_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "initializes a board" do
      expect(game.board).to eq([[1, 2, 3], [], []])
    end
  end

  describe '#move' do
    it "moves a disc" do
      game.move([0, 1])
      expect(game.board).to eq([[2,3], [1], []])
    end

  end

  describe '#valid_move?' do
    it "should be within range of board" do
      expect(game.valid_move?([7, 8])).to eq(false)
    end

    it "cannot put a larger size disc on top" do
      game.move([1, 2])
      expect(game.valid_move?([1,2])).to eq(false)
    end

    it "returns false when the starting tower is empty" do
      expect(game.valid_move?([2, 1])).to eq(false)
    end
  end

  describe '#won?' do
    it "returns true when game is won" do
      game.board = [[], [1, 2, 3], []]
      expect(game.won?).to eq(true)
    end

    it "returns false if game is not over" do
      game.board = [[3], [], [1, 2]]
      expect(game.won?).to eq (false)
    end
  end


end
