#!/usr/bin/env ruby

class Asciigram
  Position = Struct.new(:row, :col)
  attr_reader :position

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @grid = Array.new(@width) { Array.new(@height) {"O"} }
    @position = Position.new
    @position.row = @position.col = 0
  end

  def run(steps)
    steps.to_s.each_char do |command|
      case command
      when 'P'
        @grid[position.row][position.col] = 'X'
      when 'N'
        position.row -= 1
        raise Exception if position.row < 0 || position.row >= @width
      when 'E'
        position.col += 1
        raise Exception if position.col < 0 || position.col >= @height
      when 'S'
        position.row += 1
        raise Exception if position.row < 0 || position.row >= @width
      when 'W'
        position.col -= 1
        raise Exception if position.col < 0 || position.col >= @height
      end
    end

    output = []
    @grid.each do |line|
      output << line.join
    end
    output.join("\n")
  end
end

if __FILE__ == $0
  @asciigram = Asciigram.new(ARGV[0], ARGV[1])
  puts @asciigram.run(ARGV[2])
end
