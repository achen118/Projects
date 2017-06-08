require 'two_sum'

describe "#two_sum" do
  it "finds a pair where the elements sum to zero" do
    expect([-1, 1].two_sum).to eq([[0, 1]])
  end

  it "returns an empty array when none of the elements add up to zero" do
    expect([1, 2, 3, 4, 5].two_sum).to eq([])
  end

  it "returns result in the correct order" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end
