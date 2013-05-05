require 'minitest/autorun'
require 'minitest/pride'

$: << File.expand_path("../../", __FILE__)
require 'asciigram'

class TestAsciigram < MiniTest::Unit::TestCase

  def setup
    @asciigram = Asciigram.new(4, 4)
  end

  def test_run_method
    expected = "XOOX\nOXXO\nOXXO\nXOOX"
    result = @asciigram.run('PESPESPESPNNNPWSPWSPWSP')
    assert_equal expected, result
  end

  def test_steps_converts_to_string
    result = @asciigram.run(nil)
    assert result
  end

end
