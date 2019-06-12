%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+	yylval = atoi(yytext); return NUMBER;
\+	return PLUS;
-	return MINUS;
\*	return TIMES;
\/	return DIVIDE;
\n	return EOL;
[ \t]+	; // ignore whitespace
%%

