require 'helper'

class TestOutput < Minitest::Test
  def test_inspect_output
    '5 + 3'.c.inspect
  end

  def test_string_output
    '5 + 3'.c.to_s
  end

  def test_formatted_string_output
    "5 + 3\nreturn 0".c.to_formatted_s
  end
end
