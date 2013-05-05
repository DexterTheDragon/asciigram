require 'minitest/autorun'
require 'minitest/colorize'

$: << File.expand_path("../../", __FILE__)
require 'asciigram'

class TestAsciigramGrid < MiniTest::Unit::TestCase
  def setup
    @grid = Asciigram::Grid.new 5, 5
  end

  def test_can_create_instance
    assert Asciigram::Grid.new 5, 5
  end

  def test_initialize_takes_the_grid_width_height
    grid = Asciigram::Grid.new 5, 5
    assert grid
  end

  def test_grid_has_width_reader
    assert_equal @grid.width, 5
  end

  def test_grid_has_height_reader
    assert_equal @grid.height, 5
  end

  def test_initialize_sets_width_and_height
    assert_equal @grid.width, 5
    assert_equal @grid.height, 5
  end

  def test_initialize_creates_a_multi_array
    assert @grid.instance_variable_get(:@grid)
  end

  def test_print_at_position
    position = MiniTest::Mock.new
    position.expect(:row, 1)
    position.expect(:col, 3)

    @grid.print_at position
    assert_equal @grid.instance_variable_get(:@grid)[1][3], 'X'
  end

  def test_grid_to_s
    assert_equal @grid.to_s, "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
  end
end
