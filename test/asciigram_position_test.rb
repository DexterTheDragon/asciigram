require 'minitest/autorun'
require 'minitest/pride'

$: << File.expand_path("../../", __FILE__)
require 'asciigram'

class TestAsciigramPosition < MiniTest::Unit::TestCase
  def setup
    @position = Asciigram::Position.new
  end

  def test_position_has_a_row
    assert_equal @position.row, nil
    @position.row = 5
    assert_equal @position.row, 5
  end

  def test_position_has_a_col
    assert_equal @position.col, nil
    @position.col = 5
    assert_equal @position.col, 5
  end
end
