require 'pry'
require'byebug'
def range(start, end_num)
  new_arr = []
  if end_num < start
    return new_arr
  end
  next_num = end_num - 1
  new_arr += range(start, next_num)
  new_arr += [end_num]
  new_arr.sort
end

def range_iterative(start, end_num)
  (start..end_num).map do |num|
    num
  end
end

def exponent_recursion1(base, power)
  return 1 if power == 0
  base * exponent_recursion1(base, power - 1)
end

def exponent_recursion2(base, power)
  return 1 if power == 0
  if power.even?
    even_result = exponent_recursion2(base, power / 2)
    even_result * even_result
  else
    odd_result = exponent_recursion2(base, (power - 1) / 2)
    base * odd_result * odd_result
  end
end


def dup(arr)
  dup_arr = []
  return arr if arr.length < 1
  arr.each do |el|
    if el.is_a? Array
      dup(el)
    else
      dup_arr << el
    end
  end
end

def fib_recursive(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  fib_arr = fib_recursive(n - 1)
  curr_fib << fib_arr[-1] + fib_arr[-2]
end

def fib_iterative(n)
  fib_array = [0, 1]
  return fib_array[0...n] if n <= 2
  until fib_array.length == n
    fib_array << fib_array[-1] + fib_array[-2]
  end
  fib_array
end

def subsets(arr)
  return [[]] if arr.empty?
  # return [[], arr] if arr.length == 1
  # return [[], [arr.first], [arr.last], arr] if arr.length == 2
  # subset_array = subsets(arr[0..-2])
  # subset_array << [arr[-1]]
  # arr.each_with_index do |el, idx|
  #   subset_array << [el, arr.last] unless idx == arr.length-1
  # end
  # subset_array << arr
  sets = subsets(arr.take(arr.length - 1))
  sets += sets.map { |set| set + [arr.last] }
end

def permutations(arr)
  return [arr] if arr.length <= 1
  sub_perms = permutations(arr[0..-2])
  total_perms = []
  sub_perms.each do |sub|
    (0..sub.length).each do |i|
      total_perms << sub[0...i] + [arr[-1]] + sub[i..-1]
    end
  end
  total_perms
end

def bsearch(array, target)
  return nil if array.empty?
  idx = array.length / 2
  mid_value = array[idx]
  case mid_value <=> target
    when 0
      return idx
    when -1
      recursive_call = bsearch(array[(idx + 1)..-1], target)
      if recursive_call.nil?
        return nil
      else
        return recursive_call + idx + 1
      end
    when 1
      return bsearch(array[0...idx], target)
  end
end
