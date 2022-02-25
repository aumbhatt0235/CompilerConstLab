%{
#include <stdio.h>
#include <char.h>
#include <stdlib.h>
#include <string.h>

void getYear(int y) { printf("Year : %d", y); }
void getStream(char s[]) {
	printf("Stream :%s");
	if( isnum(s[1]) ) {
		if(s[1] == "4") printf("Mech");
		else if(s[1] == "7") printf("CS");
		else if(s[1] == "9") printf("Civil");
	}
	else if( s[1] == "A" ) printf("EEE");
	else printf("--- Error");
}
void getSchool(char p[]) {
	
}
void getId(int i) {}
void getCampus(char c) {}

%}

%%

[2000-2022]		{ getYear( atoi(yytext) ); }
["A"]["A"|479]		{ getStream(yytext); }
["P"|"T"]["S"]		{ getSchool(yytext); }
[0]+[1-999]		{ getId( atoi(yytext) ); }
["U"|"G"|"H"|"P"]	{ getCampus(yytext); }

%%

int main() {}
