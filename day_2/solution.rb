input = File.readlines(File.expand_path('input.txt'), __dir__)
matrix = input.first.split("\n")

def solution(matrix)
  diffs = []
  matrix.each do |line|
    nums = line.split(" ").map(&:to_i)
    diff = nums.max - nums.min
    diffs.push(diff)
  end

  return diffs.reduce(:+)
end

puts solution(matrix)
