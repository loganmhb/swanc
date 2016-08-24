default: lexer.l parse.y compiler.c
	yacc -d parse.y
	lex lexer.l
	gcc -g -Wall -Wextra -std=c99 lex.yy.c y.tab.c compiler.c -o swanc -lfl
