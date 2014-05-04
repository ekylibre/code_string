require 'helper'

class TestInstanciation < Test::Unit::TestCase

  def test_instanciation_from_string
    assert_nothing_raised do
      "5 + 3".c
    end
  end

  def test_classical_instanciation
    cs = nil

    assert_nothing_raised do
      cs = CodeString.new("5 + 3")
    end

    assert_equal :ruby, cs.language
  end

end
