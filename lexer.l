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

%%
{DIGIT}+ {yylval=yytext; return NUMBER;}
{LCURLY} return TOK_LCURLY;
{RCURLY} return TOK_RCURLY;
{LPAREN} return TOK_LPAREN;
{RPAREN} return TOK_RPAREN;
{SEMICOLON} return TOK_SEMICOLON;
{RETURN} return TOK_RETURN;
\n /* ignore newline */
[\t ]+ /* ignore whitespace */
%%
