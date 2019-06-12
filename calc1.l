%{
#include <stdio.h>
%}

%%
[0-9]+	puts("NUMBER");
\+	puts("PLUS");
-	puts("MINUS");
\*	puts("TIMES");
\/	puts("DIVIDE");
%%

