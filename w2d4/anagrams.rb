def first_anagram?(str1, str2)
  anagrams = str1.chars.permutation.to_a
  anagrams.include?(str2.chars)
end

def second_anagram?(str1, str2)
  str1_dup = str1
  arr2 = str2.chars
  str1.chars.each_with_index do |char1, index1|
    if arr2.include?(char1)
      str1_dup = str1_dup.sub(char1, "")
      arr2.delete_at(arr2.index(char1))
    end
  end
  str1_dup.chars.empty? && arr2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  hsh = Hash.new { |h, k| h[k] = [0, 0] }
  str1.chars.each do |char|
    hsh[char][0] += 1
  end
  str2.chars.each do |char|
    hsh[char][1] += 1
  end
  hsh.all? { |_, v| v[0] == v[1] }
end
