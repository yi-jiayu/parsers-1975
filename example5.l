%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  yylval = atoi(yytext); return NUMBER;
\n      return EOL;
[ \t]+  ; // ignore whitespace
.       return (int) yytext[0];
%%

