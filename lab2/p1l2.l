%{
#include <stdio.h>
%}

%%
"+"	{ printf("\n> PLUS Found\n"); }
"-"	{ printf("\n> MINUS Found\n"); }
"*"	{ printf("\n> MUL Found\n"); }
"/"	{ printf("\n> DIV Found\n"); }
"|"	{ printf("\n> ABS Found\n"); }
"\n"	{ printf("\nNEWLINE Found\n"); }
[0-9]+	{ printf("\nNUMBER Found\n"); }
.+	{ printf("\nMYSTERY Found\n"); }
%%

int main() {
	yylex();
	return 0;
}
