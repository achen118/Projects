class Array
  def my_each(&prc)
    idx = 0

    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end

  def my_select(&prc)
    result = []

    self.my_each do |el|
      result.push(el) if prc.call(el)
    end

    result
  end

  def my_reject(&prc)
    self - self.my_select(&prc)
  end

  def my_any?(&prc)
    return true if !self.my_select(&prc).empty?
    false
  end

  def my_all?(&prc)
    return true if self.my_select(&prc).length == self.length
    false
  end

  # def initialize
  #   @flattened = []
  # end

  def my_flatten
    flattened = []

    my_each do |el|
      if el.is_a?(Integer)
        flattened.push(el)
      else
        flattened += el.my_flatten
      end
    end

    flattened
  end

  def my_zip(*args)
    result = []

    self.each_with_index do |num, idx|
      merged = [num]
      args.my_each do |arg|
        merged.push(arg[idx])
      end
      result.push(merged)
    end
    result
  end

  def my_rotate(rotation = 1)
    rotated = self.dup
    rotation %= self.length
    removed = rotated.shift(rotation)
    rotated += removed
    rotated
  end

  def my_join(separator = "")
    result = ""
    self.each_with_index do |el, idx|
      if idx != self.length - 1
        result << el + separator
      else
        result << el
      end
    end
    result
  end

  def my_reverse
    result = []
    starting_idx = self.length - 1
    starting_idx.downto(0) do |idx|
      result.push(self[idx])
    end
    result
  end

  def factors(num)
    result = []

    (1..num).each do |candidate|
      result.push(candidate) if num % candidate == 0
    end

    result
  end

  def bubble_sort!(&prc)
    self.each_index do |i|
      self.each_index do |j|
        next if j <= i
        comparison = prc.call(self[i], self[j])
        if comparison == 1
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    duplicate = self.dup
    result = duplicate.bubble_sort!(&prc)
    result
  end

  def substrings(string)
    result = []
    words = string.split(" ")
    words.each do |word|
      self.each do |entry|
        result << entry if word.include?(entry)
      end
    end
    result
  end

end

p ["cat", "fat", "die", "hi"].substrings("catsfatasadfdie")
