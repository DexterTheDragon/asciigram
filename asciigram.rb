#!/usr/bin/env ruby

GRID_X = ARGV[0].to_i
GRID_Y = ARGV[1].to_i
STEPS = ARGV[2].upcase

grid = Array.new(GRID_Y) { Array.new(GRID_X) {"O"} }

position = [0,0]

STEPS.each_char do |command|
  case command
  when 'P'
    grid[position[0]][position[1]] = 'X'
  when 'N'
    position[0] -= 1
    raise Exception if position[0] < 0 || position[0] >= GRID_Y
  when 'E'
    position[1] += 1
    raise Exception if position[1] < 0 || position[1] >= GRID_X
  when 'S'
    position[0] += 1
    raise Exception if position[0] < 0 || position[0] >= GRID_Y
  when 'W'
    position[1] -= 1
    raise Exception if position[1] < 0 || position[1] >= GRID_X
  end
end

grid.each do |line|
  puts line.join
end
