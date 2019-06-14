%{
#include <stdio.h>
%}

%%
[0-9]+	printf("NUMBER ");
\+	printf("PLUS ");
-	printf("MINUS ");
\*	printf("TIMES ");
\/	printf("DIVIDE ");
[ \t]	; // ignore whitespace
%%

