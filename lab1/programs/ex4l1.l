%{
#include <stdio.h>
void digitFound() {
	printf("\nDigit found.");
}
%}

 // Macro for digits.
Digit	[0-9]

%%
{Digit}	{ digitFound(); }	// Calling function.
%%

int main() {
	yylex();
	return 0;
}
