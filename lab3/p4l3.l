%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

void getYear(int y) { printf("\nYear : %d", y); }
void getStream(char s[]) {

	printf("\nStream : ");

	if( s[1] == '4' ) printf("Mech");
	else if( s[1] == '9' ) printf("Civil");
	else if( s[1] == '7' ) printf("CS");
	else if( s[1] == 'A' ) printf("EEE");
	else printf("\n--- Error");

}
void getSchool(char p[]) {

	printf("\nSchool Type : ");

	if( p[0] == 'P' ) printf("Practice School");
	else if( p[0] == 'T' ) printf("Thesis");
	else printf("\n--- Error");

}
void getId(int i) {
	printf("\nID : %d", i);
}

void getCampus(char *c) {
	printf("\nCampus: ");
	
	switch(c[0]) {
		case 'U': printf("Dubai");
			break;
		case 'H': printf("Hyderabad");
			break;
		case 'G': printf("Goa");
			break;
		case 'P': printf("Pilani");
			break;
		default: printf("\n--- Error");
			break;
	};

	printf("\n");
}

%}

%%

[2][0][0-2][0-9]	{ getYear( atoi(yytext) ); }
["A"]["A"|479]		{ getStream(yytext); }
["P"|"T"]["S"]		{ getSchool(yytext); }
[0]*[1-999]+			{ getId( atoi(yytext) ); }
["U"|"G"|"H"|"P"]	{ getCampus(yytext); }

%%

int main() {
	yylex();
	return 0;
}
