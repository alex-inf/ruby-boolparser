require_relative 'ast'

VALID_VAR = /[a-zA-Z0-9]*/.freeze

# parser/interpreter for boolean expressions.
class Parser
  def initialize(lexer)
    @lexer = lexer
    parse
  end

  def eval(vars)
    @root_node.eval(vars)
  end

  def to_s
    @root_node.to_s
  end

  def parse
    expression
  end

  def expression
    term

    while @token == '|'
      lhs = @root_node
      term
      rhs = @root_node
      @root_node = Or.new(lhs, rhs)
    end
  end

  def term
    factor

    while @token == '&'
      lhs = @root_node
      factor
      rhs = @root_node
      @root_node = And.new(lhs, rhs)
    end
  end

  def factor
    @token = @lexer.next_token

    if @token == ''
    elsif @token == '!'
      factor
      @root_node = Not.new(@root_node)
    elsif @token == '('
      expression
      @token = @lexer.next_token
    elsif var?(@token)
      @root_node = Value.new(@token)
      @token = @lexer.next_token
    else
      raise("Unknown symbol #{@token}")
    end
  end

  def var?(token)
    raise('Empty token!') if token.empty?

    if VALID_VAR =~ token
      true
    else
      false
    end
  end
end