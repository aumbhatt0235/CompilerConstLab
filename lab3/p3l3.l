%{
#include <stdio.h>
%}

%%

"//".*			{ printf("%s\n-> ", yytext); }
.			{ fprintf(yyout, "%s", yytext); }

%%


int main() {
	yyin = fopen("inputQ3.c", "r");
	yyout = fopen("outputQ3.c", "w");
	yylex();
	return 0;
}
