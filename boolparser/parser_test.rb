require 'test/unit'
require_relative 'parser'
require_relative 'lexer'

class ParserTest < Test::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_parser
    parser = Parser.new(Lexer.new('a&b&!c'))

    vars = {"a": true, "b": true, "c": false}
    assert_equal(true, parser.eval(vars), 'Wrong result detected')

    vars = {"a": true, "b": true, "c": true}
    assert_equal(false, parser.eval(vars), 'Wrong result detected')

    vars = {"a": false, "b": false, "c": false}
    assert_equal(false, parser.eval(vars), 'Wrong result detected')


    parser = Parser.new(Lexer.new('a & (b | c & b) & d'))

    vars = {"a": true, "b": true, "c": false, "d": true}
    assert_equal(true, parser.eval(vars), 'Wrong result detected')

    assert_equal("&(&('a',|('b',&('c','b'))),'d')", parser.to_s, 'Wrong string representation')

  end
end