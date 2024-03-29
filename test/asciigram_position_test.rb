require 'minitest/autorun'
require 'minitest/colorize'

$: << File.expand_path("../../", __FILE__)
require 'asciigram'

class TestAsciigramPosition < MiniTest::Unit::TestCase
  def setup
    grid = MiniTest::Mock.new
    grid.expect(:width, 4)
    grid.expect(:height, 4)
    @position = Asciigram::Position.new grid
  end

  def test_initialize_takes_the_grid_width_height
    grid = MiniTest::Mock.new
    grid.expect(:width, 4)
    grid.expect(:height, 4)
    position = Asciigram::Position.new grid
    assert position
  end

  def test_initialize_sets_width_and_height
    assert_equal @position.instance_variable_get(:@width), 4
    assert_equal @position.instance_variable_get(:@height), 4
  end

  def test_row_setter_throws_exception_if_outside_grid
    assert_raises(RuntimeError) { @position.row = -1 }
    assert_raises(RuntimeError) { @position.row = 100 }
  end

  def test_col_setter_throws_exception_if_outside_grid
    assert_raises(RuntimeError) { @position.col = -1 }
    assert_raises(RuntimeError) { @position.col = 100 }
  end

  def test_position_has_a_row
    assert_equal @position.row, 0
    @position.row = 3
    assert_equal @position.row, 3
  end

  def test_position_has_a_col
    assert_equal @position.col, 0
    @position.col = 3
    assert_equal @position.col, 3
  end
end
