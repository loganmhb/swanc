%{
#include <stdio.h>
#include <string.h>
#include "ast.h"

#define YYSTYPE char*

void yyerror(const char* str) {
    fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
    return 1;
}

struct ast_node *parse_result;
%}

%token TOK_LPAREN TOK_RPAREN TOK_LCURLY TOK_RCURLY TOK_SEMICOLON
%token NUMBER TOK_RETURN ID PRIMTYPE

%%
function:      type ID TOK_LPAREN TOK_RPAREN statement
                {
                    struct ast_node node;
                    node.class = FUNCTION;
                    node.function.name = $2;
                    node.function.body = $5;
                    parse_result = &node;
                }
        ;


type:          PRIMTYPE /* currently ignored */
        ;

statements:     /* empty */
        |        statements statement
                {
                    $$ = $2;
                }
        ;

statement:      TOK_RETURN expr TOK_SEMICOLON
                {
                    struct ast_node node;
                    node.class = RETURN;
                    node.return_value = $2;
                    $$ = &node;
                }
        |        TOK_LCURLY statements TOK_RCURLY
        ;

expr:           NUMBER
                {
                    struct ast_node node;
                    node.class = CONSTANT;
                    node.value = atoi($1);
                    $$ = &node;
                }
        ;

%%
