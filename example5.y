%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *str) {
	fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
	return 1;
}

int main() {
	return yyparse();
}
%}

%token NUMBER EOL

%%

lines:
	| lines line
	;

line:
	EOL
	|
	expr EOL
	{
		printf("= %d\n", $1);
	}
	;

expr:
	NUMBER { $$ = $1; }
	|
	'-' NUMBER { $$ = -$2; }
	|
	NUMBER '+' NUMBER { $$ = $1 + $3; }
	|
	NUMBER '-' NUMBER { $$ = $1 - $3; }
	|
	NUMBER '*' NUMBER { $$ = $1 * $3; }
	|
	NUMBER '/' NUMBER { $$ = $1 / $3; }
	;

%%
