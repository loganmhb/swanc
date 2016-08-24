%{
#include <stdio.h>
#include <string.h>

#define YYSTYPE char*

void yyerror(const char* str) {
    fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
    return 1;
}

main() {
    yyparse();
 }
%}

%token TOK_LPAREN TOK_RPAREN TOK_LCURLY TOK_RCURLY TOK_SEMICOLON
%token NUMBER TOK_RETURN

%%
statements:     /* empty */
        |        statements statement
        ;

statement:      TOK_RETURN NUMBER TOK_SEMICOLON
                {
                    printf("got number: %d", atoi($2));
                }
        |        TOK_LCURLY statements TOK_RCURLY
        ;

%%
