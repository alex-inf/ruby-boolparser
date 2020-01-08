# An interpreter (parser/compiler) for boolean expressions with variables
class Lexer
  attr_accessor :tokens

  def initialize(input)
    @input = input
    @current = 0
    @tokens = split_tokens(input)
  end

  def next_token
    return '' if @current == @tokens.length

    token = @tokens[@current]
    @current += 1
    token
  end

  def split_tokens(input)
    result = []
    token = ''

    input.each_char do |current_char|
      next if current_char == ' '

      case current_char
      when '&', '|', '!', '(', ')'
        if token != ''
          result << token
          token = ''
        end
        result << current_char
      else
        token << current_char
      end
    end

    result << token if token != ''

    result
  end
end