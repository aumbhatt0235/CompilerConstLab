%{
#include <stdio.h>
int count=0;
%}

%%
[0-9]+ 			{ printf("%d NUMBER : %s", ++count, yytext); }
[a-zA-Z]+		{ printf("%d WORD   : %s", ++count, yytext); }
[a-zA-Z][a-zA-Z0-9]+	{ printf("%d OTHER  : %s", ++count, yytext); }
%%

int main() {
	yylex();
	return 0;
}
