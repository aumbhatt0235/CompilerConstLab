%{
#include "y.tab.h"
// int yylval;
%}

%%
[+]		return PLUS;
[-]		return MINUS;
[*]		return MUL;
"/"		return DIV;
"="		return EQL;
["("]		return LPR;
[")"]		return RPR;
[a-z]		{ yylval.v = *yytext -'a'; return VAR;}
"^"		return POW;
\n		return NL;
[0-9]+(\.([0-9]+))?	{ //printf("text: %s", yytext); 
yylval.val = atof(yytext); //printf("Float%f\n", yylval.val); 
return INT; }
[ \t]		{}
.		{ printf("\nMystery Character"); }
%%
