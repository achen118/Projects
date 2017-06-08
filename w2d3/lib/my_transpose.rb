
# def my_transpose(matrix)
#   debugger
#   matrix[0].zip(matrix[1..-1].flatten(1))
#
# end
#
# my_transpose([[0,1,2], [3,4,5], [6,7,8]])

def my_transpose(matrix)
  raise "Not a two dimensional array" unless matrix.length > 1 && matrix[0].is_a?(Array)
  result = Array.new(matrix.length) {Array.new(matrix.length)}

  result.each_index do |row|
    result[row].each_index do |col|
      result[row][col] = matrix[col][row]
    end
  end

  result
end
