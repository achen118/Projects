require "remove_dups"

describe "#my_uniq" do
  it "only accepts an array" do
    expect { my_uniq("hello") }.to raise_error("only accepts an array!")
  end

  it "removes duplicates" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end

  it "returns duplicates in correct order" do
    expect(my_uniq([3, 2, 1, 2, 3])).to eq([3, 2, 1])
  end

end
