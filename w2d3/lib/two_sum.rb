class Array

  def two_sum
    results = []
    self.each_index do |idx1|
      (idx1 + 1...length).each do |idx2|
        results << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    results
  end

end
