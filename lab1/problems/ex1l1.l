%{
#include <stdio.h>
%}

%%
stop	printf("\nstop command received\n");
start	printf("\nstart command received\n");
%%
int main() {
	yylex();
	return 0;
}
