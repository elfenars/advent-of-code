file = File.open(File.expand_path('input.txt', __dir__), 'r')
input = file.read.delete!("\n")
file.close

def solution(input)
  prev   = nil
  to_sum = []
  input.chars.each do |item|
    to_sum.push(item.to_i) if item.to_i == prev.to_i
    prev = item
  end

  to_sum.push(prev.to_i) if input[0].to_i == input[-1].to_i
  return to_sum.reduce(:+)
end

puts solution(input)
