require 'helper'

class TestOutput < Test::Unit::TestCase

  def test_inspect_output
    assert_nothing_raised do
      "5 + 3".c.inspect
    end
  end

  def test_string_output
    assert_nothing_raised do
      "5 + 3".c.to_s
    end
  end

  def test_formatted_string_output
    assert_nothing_raised do
      "5 + 3\nreturn 0".c.to_formatted_s
    end
  end

end
