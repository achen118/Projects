def bad_two_sum?(arr, target_sum) # O(n^2)
  (0...arr.length - 1).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      if arr[idx1] + arr[idx2] == target_sum
        return true
      end
    end
  end
  false
end


#assumes no negative numbers in array
# def okay_two_sum?(arr, target_sum)
#   sorted_arr = arr.sort
#   target_idx = bsearch(sorted_arr, target_sum)
#   results = sorted_arr[0..target_idx]
#   results.each do |num|
#     return true if results.include?(target_sum - num)
#   end
#   false
# end
#
# def bsearch(arr, target)
#   return nil if arr.empty?
#   middle_idx = arr.length / 2
#
#   case target <=> arr[middle_idx]
#   when -1
#     bsearch(arr.take(middle_idx), target)
#   when 0
#     return middle_idx
#   when 1
#     recursive_call = bsearch(arr.drop(middle_idx + 1), target)
#     recursive_call.nil? ? nil : recursive_call + middle_idx + 1
#   end
#
# end

def two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each { |el| hash[el] += 1 }

  start_pt = (target_sum / 2.0).ceil

  if target_sum % 2 == 0 && hash[start_pt] == 2
    return true
  end

  lower_keys = hash.keys.select { |k| k <= start_pt }
  lower_keys.each do |key|
    check_key = target_sum - key
    if hash.key?(check_key) && (check_key) != start_pt
      return true
    end
  end
  false
end
