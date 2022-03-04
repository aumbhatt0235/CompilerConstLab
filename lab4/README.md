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

## Runnning LEX & YACC
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
lex y.tab.c lex.yy.c -ll
```
where `y.tab.c` is the parser.
<br>

