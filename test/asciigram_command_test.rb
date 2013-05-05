require 'minitest/autorun'
require 'minitest/pride'

class TestAsciigramCommandLine < MiniTest::Unit::TestCase

  def test_command_invocation
    output = `./asciigram.rb 4 4 PESPESPESPNNNPWSPWSPWSP`.chomp
    expected = "XOOX\nOXXO\nOXXO\nXOOX"
    assert_equal expected, output
  end

end
