%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
	return 1;
}

int main()
{
	yyparse();
}
%}

%token NUMBER PLUS MINUS TIMES DIVIDE EOL

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
	MINUS NUMBER { $$ = -$2; }
	|
	NUMBER PLUS NUMBER { $$ = $1 + $3; }
	|
	NUMBER MINUS NUMBER { $$ = $1 - $3; }
	|
	NUMBER TIMES NUMBER { $$ = $1 * $3; }
	|
	NUMBER DIVIDE NUMBER { $$ = $1 / $3; }
	;

%%
