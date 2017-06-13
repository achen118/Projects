#Phase 1

def my_min(list)
  min = list.first
  (0..list.length - 2).each do |idx1|
    (idx1 + 1..list.length - 1).each do |idx2|
      if list[idx1] < list[idx2]
        min = list[idx1] if list[idx1] < min
      end
    end
  end
  min
end


#Phase 2

def my_min2(list)
  min = list.first
  (1..list.length - 1).each do |idx|
    if list[idx] < min
      min = list[idx]
    end
  end
  min
end

#Largest Contiguous Sub-sum

#Phase 1

def subsum1(list)
  results = []
  (0..list.length - 1).each do |idx1|
    (idx1..list.length - 1).each do |idx2|
      subarray = list[idx1..idx2]
      sum = subarray.inject(&:+)
      results << sum
    end
  end
  results.max
end

#Phase 2

def subsub2(list)
  return list.max if list.all? { |element| element < 0 }

  largest_sum = 0
  current_sum = 0

  list.each do |element|
    # if current_sum == nil
    #   current_sum = element
    # end
    current_sum += element
    largest_sum = current_sum if current_sum > largest_sum
    current_sum = 0 if current_sum < 0
  end

  largest_sum
end
