class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_num = 0
    self.each_with_index do |el, idx|
      hash_num += (el.hash * idx.hash + idx.hash)
    end
    hash_num
  end
end

class String
  def hash
    hash_num = 0
    self.chars.each_with_index do |char, idx|
      hash_num += (char.ord.hash * idx.hash + idx.hash)
    end
    hash_num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_num = 0
    self.each do |key, value|
      hash_num += key.hash * value.hash
    end
    hash_num
  end
end
