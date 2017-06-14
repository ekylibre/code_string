require 'helper'

class TestConcatenation < Minitest::Test
  def test_valid_concatenation
    "5 + 3\n".c + '5 + 3'.c

    "5 + 3\n".c + '5 + 3'.c(:ruby)
  end

  def test_invalid_concatenation
    assert_raises CodeString::IncompatibleLanguage do
      "5 + 3\n".c + '5 + 3'.c(:javascript)
    end

    assert_raises CodeString::IncompatibleLanguage do
      "5 + 3\n".c(:c) + '5 + 3'.c
    end
  end
end
