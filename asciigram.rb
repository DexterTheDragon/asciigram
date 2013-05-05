#!/usr/bin/env ruby

class Asciigram
  class Position
    attr_reader :row, :col

    def initialize(width, height)
      @row = 0
      @col = 0
      @width = width
      @height = height
    end

    def row= value
      raise RuntimeError, 'Movement outside of grid' if value < 0 || value >= @width
      @row = value
    end

    def col= value
      raise RuntimeError, 'Movement outside of grid' if value < 0 || value >= @height
      @col = value
    end
  end

  class Grid
    def initialize(width, height)
      @width = width.to_i
      @height = height.to_i
      @grid = Array.new(@width) { Array.new(@height) {"O"} }
    end

    def print_at(position)
      @grid[position.row][position.col] = 'X'
    end

    def to_s
      output = []
      @grid.each do |line|
        output << line.join
      end
      output.join("\n")
    end
  end

  attr_reader :position

  def initialize(width, height)
    width = width.to_i
    height = height.to_i
    @grid = Grid.new width, height
    @position = Position.new width, height
  end

  def run(steps)
    steps.to_s.each_char do |command|
      case command
      when 'P'
        @grid.print_at position
      when 'N'
        position.row -= 1
      when 'E'
        position.col += 1
      when 'S'
        position.row += 1
      when 'W'
        position.col -= 1
      end
    end

    @grid.to_s
  end
end

if __FILE__ == $0
  @asciigram = Asciigram.new(ARGV[0], ARGV[1])
  puts @asciigram.run(ARGV[2])
end
