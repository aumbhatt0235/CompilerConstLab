%{
#include "y.tab.h"
%}

%%
[+]	return PLUS;
[-]	return MINUS;
\n	return NL;
[0-9]+	return INT;
[ \t]	{}
.	printf("\nMystery Character");
%%
