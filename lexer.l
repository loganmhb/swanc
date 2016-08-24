%{
#include <stdio.h>
#include "y.tab.h"
%}

DIGIT [0-9]
SEMICOLON ";"
LPAREN "("
RPAREN ")"
LCURLY "{"
RCURLY "}"
RETURN "return"
INT "int"
ID [a-zA-Z][a-zA-Z0-9]*

%%
{DIGIT}+ {yylval=yytext; return NUMBER;}
{LCURLY} return TOK_LCURLY;
{RCURLY} return TOK_RCURLY;
{LPAREN} return TOK_LPAREN;
{RPAREN} return TOK_RPAREN;
{SEMICOLON} return TOK_SEMICOLON;
{RETURN} return TOK_RETURN;
{INT} {yylval = yytext; return PRIMTYPE;}
{ID} {yylval=yytext; return ID;}
\n /* ignore newline */
[\t ]+ /* ignore whitespace */
%%
