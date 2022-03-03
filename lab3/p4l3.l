%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

void getYear(int y) { printf("Year : %d", y); }
void getStream(char s[]) {

	printf("Stream : ");

	if( strcmp(s[1], "4") ) printf("Mech");
	else if( strcmp(s[1], "7") ) printf("CS");
	else if( strcmp(s[1], "9") ) printf("Civil");
	else if( strcmp(s[1], "A") ) printf("EEE");
	else printf("--- Error");

	printf("\n");
}
void getSchool(char p[]) {

	printf("School Type :\n");

	if( strcmp(p[0], "P") )	printf("Practice School");
	else if( strcmp(p[0], "T") ) printf("Thesis");
	else printf("--- Error");

	printf("\n");
}
void getId(int i) {
	printf("ID : %d\n");
}
void getCampus(char c) {
	switch(c) {
		case 'U': printf("Dubai");
			break;
		case 'H': printf("Hyderabad");
			break;
		case 'G': printf("Goa");
			break;
		case 'P': printf("P");
			break;
		default: printf("--- Error");
			break;
	};
	printf("\n");
}

%}

%%

[2][0][0-2][0-9]	{ getYear( atoi(yytext) ); }
["A"]["A"|479]		{ getStream(yytext); }
["P"|"T"]["S"]		{ getSchool(yytext); }
[0]+[1-999]		{ getId( atoi(yytext) ); }
["U"|"G"|"H"|"P"]	{ getCampus(yytext); }

%%

int main() {
	yylex();
	return 0;
}
