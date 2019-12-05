require 'pry'

$program    = File.read("input.txt").split(",").map(&:strip).map(&:to_i)
$program[1] = 12
$program[2] = 2

def process(set)
  opcode = set[0]
  value1 = $program[set[1]]
  value2 = $program[set[2]]

  $program[set[3]] = opcode == 1 ? (value1 + value2) : (value1 * value2)
end

def run_program
  counter = 0

  loop do
    set    = $program[counter..counter+3]
    opcode = set[0]

    if opcode == 99
      return $program[0]
    else
      process(set)
      counter += 4
    end
  end
end

puts run_program
