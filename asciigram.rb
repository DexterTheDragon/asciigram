#!/usr/bin/env ruby

class Asciigram
  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @grid = Array.new(@width) { Array.new(@height) {"O"} }
    @position = [0,0]
  end

  def run(steps)
    steps.each_char do |command|
      case command
      when 'P'
        @grid[@position[0]][@position[1]] = 'X'
      when 'N'
        @position[0] -= 1
        raise Exception if @position[0] < 0 || @position[0] >= @width
      when 'E'
        @position[1] += 1
        raise Exception if @position[1] < 0 || @position[1] >= @height
      when 'S'
        @position[0] += 1
        raise Exception if @position[0] < 0 || @position[0] >= @width
      when 'W'
        @position[1] -= 1
        raise Exception if @position[1] < 0 || @position[1] >= @height
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
