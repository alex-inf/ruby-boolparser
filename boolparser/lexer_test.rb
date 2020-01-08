require 'test/unit'
require_relative 'lexer'

class LexerTest < Test::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_lexer
    lexer = Lexer.new('a & b')
    assert_equal(3, lexer.tokens.length, 'Wrong token count!')

    lexer = Lexer.new('a|b')
    assert_equal(3, lexer.tokens.length, 'Wrong token count!')

    lexer = Lexer.new('a|b&(b|c)')
    assert_equal(9, lexer.tokens.length, 'Wrong token count!')

    token = lexer.next_token
    while token != ''
      puts token
      token = lexer.next_token
    end
  end
end