help:
	clear
	@echo "---------------------------------------------------------------------------------------------------------"
	@echo "Usage: make <target>"
	@echo "---------------------------------------------------------------------------------------------------------"
	@echo "Valid targets are:"
	@echo "       make test : Runs all tests."
	@echo "       make test-ast : Runs ast_test.rb."
	@echo "       make test-lexer : Runs lexer_test.rb."
	@echo "       make test-parser : Runs parser_test.rb."
	@echo "       make help : This info.                                                                            "
	@echo "---------------------------------------------------------------------------------------------------------"

test: test-ast test-lexer test-parser

test-ast:
	ruby boolparser/ast_test.rb

test-lexer:
	ruby boolparser/lexer_test.rb

test-parser:
	ruby boolparser/parser_test.rb
