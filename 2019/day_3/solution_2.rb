require 'pry'

def get_input
  file   = File.readlines("input.txt")
  $wire1 = file[0].split(",").map(&:strip)
  $wire2 = file[1].split(",").map(&:strip)
end

def travel(direction)
  case direction
    when "R", "U"
      return 1
    when "L", "D"
      return -1
    else
      return 0
  end
end

def walk_wire(wire)
  points      = []
  point_moves = {}

  x      = 0
  y      = 0
  moves  = 0
  wire.each do |instruction|
    direction = instruction[0]
    steps     = instruction[1..-1].to_i

    steps.times do
      if %w(R L).include?(direction)
        x += travel(direction)
      else
        y += travel(direction)
      end

      moves += 1
      point  = [x,y]

      points << point
      point_moves[point] = moves unless point_moves[point]
    end
  end

  return point_moves
end

# Start here
get_input
w1 = walk_wire($wire1)
w2 = walk_wire($wire2)

intersections       = w1.keys & w2.keys
manhattan_distances = intersections.map{ |point| point[0].abs + point[1].abs }
puts "Shortest manhattan distance: #{manhattan_distances.min}"

steps_count = intersections.map{ |point| w1[point] + w2[point] }
puts "Shortest step count to an intersection: #{steps_count.min}"
