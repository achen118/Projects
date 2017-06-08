def my_uniq(array)
  raise "only accepts an array!" unless array.is_a?(Array)
  result = []
  array.each do |el|
    result << el unless result.include?(el)
  end
  result
end
