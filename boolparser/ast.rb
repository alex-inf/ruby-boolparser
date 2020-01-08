# An abstract syntax tree for boolean expressions.
class Node
  def eval(vars)
    raise 'should be overwritten'
  end
end

# Or is the logical OR Operator in an AST
class Or < Node
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def eval(vars)
    @lhs.eval(vars) || @rhs.eval(vars)
  end

  def to_s
    "|(#{@lhs},#{@rhs})"
  end
end

# And is the logical AND Operator in an AST
class And < Node
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def eval(vars)
    @lhs.eval(vars) && @rhs.eval(vars)
  end

  def to_s
    "&(#{@lhs},#{@rhs})"
  end
end

# Not is the NOT operator in the AST
class Not < Node
  def initialize(expression)
    @expression = expression
  end

  def eval(vars)
    !@expression.eval(vars)
  end

  def to_s
    "!(#{@expression})"
  end
end

# Value is a boolean variable in an AST
class Value < Node
  def initialize(name)
    @name = name
  end

  def eval(vars)
    vars[@name.to_sym]
  end

  def to_s
    "'#{@name}'"
  end
end