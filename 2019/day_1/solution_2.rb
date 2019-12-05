require 'pry'

$total = 0

def calculate_fuel(mass)
  result = (( mass / 3 ).floor - 2 )

  if result > 0
    $total += result
    calculate_fuel(result)
  end
end

def get_masses
  File.readlines("input.txt").each do |line|
    calculate_fuel(line.to_i)
  end

  $total
end

puts get_masses
