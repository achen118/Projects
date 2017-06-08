require 'my_transpose'

describe "#my_transpose" do

  it "Only accepts two dimensional arrays as argument" do
    expect { my_transpose([1, 2]) }.to raise_error("Not a two dimensional array")
  end

  it "returns the correct result" do
    expect(my_transpose([[0,1,2], [3,4,5], [6,7,8]])).to eq([[0,3,6], [1,4,7], [2,5,8]])
  end

end
