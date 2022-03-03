%{
#include <stdio.h>
int lineCount = 0;
%}

%%

.*"\n"	{ ++lineCount; fprintf(yyout, "%d %s", lineCount, yytext); }

%%


int main() {
	yyin = fopen("inputQ2.c", "r");
	yyout = fopen("outputQ2.c", "w");
	yylex();
	return 0;
}
