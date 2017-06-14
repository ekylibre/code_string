require 'helper'

class TestInstanciation < Minitest::Test
  def test_instanciation_from_string
    '5 + 3'.c
  end

  def test_classical_instanciation
    cs = nil

    cs = CodeString.new('5 + 3')

    assert_equal :ruby, cs.language
  end
end
