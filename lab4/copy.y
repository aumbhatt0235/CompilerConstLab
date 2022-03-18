%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *);
int yylex(void);
int symbol[26];
%}
%union { float val; int v; }
%token PLUS MINUS MUL DIV EQL LPR RPR NL
%token <val> INT
%token <v> VAR
%type <val> E
%left PLUS MINUS
%left MUL DIV
%right POW EQL
%%
PGM 	: PGM STMT NL	{ printf("\nUSER: "); }
	|   
	;

STMT	: E		{ printf("CALC: %f\n", $1); }
     	| VAR EQL E	{ symbol[$1] = $3; }
	;

E	: E PLUS E	{ $$ = $1 + $3; }
 	| E MINUS E	{ $$ = $1 - $3; }
	| E MUL E	{ $$ = $1 * $3; }
	| E DIV E	{ $$ = $1 / $3; }
	| VAR		{ $$ = symbol[$1]; }
	| LPR E RPR	{ $$ = $2; }
 	| INT		{ $$ = $1; }
  	;
%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	printf("\nUSER: ");
	yyparse();
//	printf("\n\n%d",symbol[1] );
	return 0;
}
