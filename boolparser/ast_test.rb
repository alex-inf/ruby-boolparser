require 'test/unit'
require_relative 'ast'

class AstTest < Test::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_ast
    # AST for expression: "A AND B OR !C"
    ast = Or.new(And.new(Value.new('A'), Value.new('B')), Not.new(Value.new('C')))
    table = [
      [false, false, false, true],
      [false, false, true, false],
      [false, true, true, false],
      [false, true, false, true],
      [true, false, false, true],
      [true, true, false, true],
      [true, false, true, false],
      [true, true, true, true],
    ]

    table.each do |values|
      expression_values = {"A": values[0], "B": values[1], "C": values[2]}
      expected_result = values[3]

      result = ast.eval(expression_values)

      assert_equal(expected_result, result, "Expected #{expected_result} but got #{result}. (Expression := #{ast}, Vars := #{expression_values}")
    end
  end
end