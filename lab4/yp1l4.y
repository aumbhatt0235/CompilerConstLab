%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *);
int yylex(void);
%}
%union { float val; }
%token PLUS MINUS MUL DIV NL
%token <val> INT
%type <val> E
%left PLUS MINUS
%left MUL DIV
%right POW
%%
PGM 	: PGM E NL { printf("%f\n", $2); }
	|   
	;

E	: E PLUS E	{ $$ = $1 + $3; }
 	| E MINUS E	{ $$ = $1 - $3; }
	| E MUL E	{ $$ = $1 * $3; }
	| E DIV E	{ $$ = $1 / $3; }
 	| INT		{ $$ = $1; }
  	;
%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	yyparse();
	return 0;
}
