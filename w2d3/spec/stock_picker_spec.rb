require "stock_picker"

describe "#stock_picker" do

  it "returns the correct result" do
    expect(stock_picker([13,5,25,14,9,28])).to eq([1,5])
  end

  it "only sells after buying" do
    expect(stock_picker([28,5,3,1])).to eq([])
  end

end
