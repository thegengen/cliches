require 'test_helper'

class DefinitionTest < Minitest::Test
  def setup
    Cliches::Definition.reset!
  end

  def test_new
    d = Cliches::Definition.new(:test)

    assert_equal :test, d.name
    assert_equal Hash.new, d.value
  end

  def test_new_with_string
    d = Cliches::Definition.new('test')

    assert_equal :test, d.name
  end

  def test_as
    d = Cliches::Definition.new(:test)
    d.as(a: 3, b: 5)

    assert_equal 3, d.value[:a]
    assert_equal 5, d.value[:b]
  end

  def test_define
    d = Cliches.define(:example)

    assert_equal d, Cliches::Definition.find(:example)
  end

  def test_define_as
    Cliches.define(:example).as(a: 3)

    d = Cliches::Definition.find(:example)
    assert_equal 3, d.value[:a]
  end
end