%{
#include <stdio.h>
int n;
%}

%%
[0-9]+	{ n=atoi(yytext);if(n%2==0)printf("EVEN");else printf("ODD"); }
.	{ printf("\n> Error: NaN"); }
%%

int main() {
	yylex();
	return 0;
}
