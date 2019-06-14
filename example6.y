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

%left '+' '-'
%left '*' '/'
%left NEG

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
	'-' NUMBER %prec NEG { $$ = -$2; }
	|
	expr '+' expr { $$ = $1 + $3; }
	|
	expr '-' expr { $$ = $1 - $3; }
	|
	expr '*' expr { $$ = $1 * $3; }
	|
	expr '/' expr { $$ = $1 / $3; }
	;

%%
