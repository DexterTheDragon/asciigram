require 'minitest/autorun'

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

  def test_command_invocation
    output = `./asciigram.rb 4 4 PESPESPESPNNNPWSPWSPWSP`.chomp
    expected = "XOOX\nOXXO\nOXXO\nXOOX"
    assert_equal expected, output
  end
end
