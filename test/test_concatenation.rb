require 'helper'

class TestConcatenation < Test::Unit::TestCase

  def test_valid_concatenation
    assert_nothing_raised do
      "5 + 3\n".c + "5 + 3".c
    end

    assert_nothing_raised do
      "5 + 3\n".c + "5 + 3".c(:ruby)
    end
  end

  def test_invalid_concatenation
    assert_raise CodeString::IncompatibleLanguage do
      "5 + 3\n".c + "5 + 3".c(:javascript)
    end

    assert_raise CodeString::IncompatibleLanguage do
      "5 + 3\n".c(:c) + "5 + 3".c
    end
  end

end
