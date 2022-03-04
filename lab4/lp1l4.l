%{
#include "y.tab.h"
// int yylval;
%}

%%
[+]	return PLUS;
[-]	return MINUS;
\n	return NL;
[0-9]+	{ yylval = atoi(yytext); return INT; }
[ \t]	{}
.	{ printf("\nMystery Character"); }
%%
