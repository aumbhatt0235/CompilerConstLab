%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *);
int yylex(void);
int symbol[26];
%}
%union { float val; int v; }
%token PLUS MINUS MUL DIV EQL BRKT NL
%token <val> INT
%token <v> VAR
%type <val> E
%left PLUS MINUS
%left MUL DIV
%right POW EQL
%%
PGM 	: PGM STMT NL
	|   
	;

STMT	: E		{ printf("%d\n", $1); }
     	| VAR EQL E	{ printf("%dvar:, %fval",$1, $3); symbol[$1] = $3; printf("assigned=%d", symbol[$1]); }
	;

E	: E PLUS E	{ $$ = $1 + $3; }
 	| E MINUS E	{ $$ = $1 - $3; }
	| E MUL E	{ $$ = $1 * $3; }
	| E DIV E	{ $$ = $1 / $3; }
	| VAR		{ printf("\n$1=%d, sym=%d", $1, symbol[$1]); $$ = symbol[$1]; }
	| E EQL E	{ $$ = $1; }
	| BRKT E BRKT	{ $$ = $2; }
 	| INT		{ $$ = $1; }
  	;
%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	yyparse();
	printf("\n\n%d",symbol[1] );
	return 0;
}
