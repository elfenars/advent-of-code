require 'pry'

def calculate_fuel
  result = 0

  File.readlines("input.txt").each do |line|
    result += (line.to_i / 3).floor - 2
  end

  result
end

puts calculate_fuel
