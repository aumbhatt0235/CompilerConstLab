%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
int yylex(void);
%}

%token PLUS MINUS NL INT

%%
PGM : E NL { printf(" = %d", $1); exit(0); }
   ;

E : E PLUS E	{ $$ = $1 + $3; }
  | E MINUS E	{ $$ = $1 - $3; }
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
