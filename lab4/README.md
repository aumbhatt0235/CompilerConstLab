### Lab 4 - 04/03/2022
# Learning YACC
- Bottom-Up Parser.
- Tool for generating parser.
- Source File has extension of `.y`.

## Structure of .y File:
```yacc
// Declaration Section
%{
#include "y.tab.h"

%}
%token INTEGER PLUS MINUS NL

// Grammer Rules
%%
E: E PLUS E
 | T
 ;

// eq. to E -> E + E | T

%%

Auxillary C Functions

int main() {
	yyparse();
	return 0;
}
```

## Running LEX & YACC
<file.l> --> lex source
<file.y> --> yacc source

```
yacc -d <file.y>
```
In command above `-d` flag generates definition.
<br>
```
lex <file.l>
```
Over here, `y.tab.h` is already included in lex source.
<br>
```
gcc y.tab.c lex.yy.c -ll
```
where `y.tab.c` is the parser.
<br>

## YACC Directives
Left Associativity is given to operators PLUS & MINUS as follows: in `.y`
```YACC
%left PLUS MINUS
```

## Order of Precedence
In YACC, the order of precedence is from LOW to HIGH: in `.y`
```YACC
%left PLUS MINUS // Lower Precedence
%left MUL DIV	// Higher Precedence
%right POW
```

## Union Construct
Allows us to change the datatype of the input.
Example: Taking floating point input:
In `.y`
```YACC
// Declaration

%union 
{
	float val;
}
%token <val> INT
%type <val> E
%token PLUS MINUS
```
In `.l`
```lex
[0-9]+(.[0-9]+) {
	yylval.val = atoi(yytext);
	return INT;
}
```
