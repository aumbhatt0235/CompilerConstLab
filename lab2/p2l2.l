%{
#include <stdio.h>
int chars=0;
int words=0;
int lines=0;
%}

%%
[a-zA-Z]+	{ ++words; chars+=strlen(yytext); }
"\n"		{ ++lines; ++chars; }
.+		{ ++chars; }
%%

int main() {
	yyin = fopen("i2l2", "r");
	yylex();
	printf("\nChars: %d", chars);
	printf("\nWords: %d", words);
	printf("\nLines: %d", lines);
	return 0;
}
