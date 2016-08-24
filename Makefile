default: compiler.c
	gcc -Wall -Wextra -std=c99 compiler.c -o swanc

parser: lexer.l parse.y
	yacc -d parse.y
	lex lexer.l
	gcc lex.yy.c y.tab.c -o test -lfl
