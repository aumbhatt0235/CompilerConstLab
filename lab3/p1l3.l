%{
#include <stdio.h>
%}

%%
[0]*[1][0]+	{ printf("> Power of 2"); }
[0-1]+		{ printf("> Not Power of 2"); }
[0-9]+		{ printf("> Incorrect Input"); }


%%

int main() {
	yylex();
	return 0;
}
