require 'pry'

def load_program(noun, verb)
  $program    = File.read("input.txt").split(",").map(&:strip).map(&:to_i)
  $program[1] = noun
  $program[2] = verb
end

def process(set)
  opcode = set[0]
  value1 = $program[set[1]]
  value2 = $program[set[2]]

  $program[set[3]] = opcode == 1 ? (value1 + value2) : (value1 * value2)
end

def run_program(noun, verb)
  load_program(noun,verb)

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

(0..99).each do |noun|
  (0..99).each do |verb|
    result = run_program(noun,verb)

    if result == 19690720
      puts "Noun: #{noun} | Verb: #{verb}"
      puts 100 * noun + verb
    end
  end
end
