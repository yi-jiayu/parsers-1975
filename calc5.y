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

%left PLUS MINUS
%left TIMES DIVIDE
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
	MINUS NUMBER %prec NEG { $$ = -$2; }
	|
	expr PLUS expr { $$ = $1 + $3; }
	|
	expr MINUS expr { $$ = $1 - $3; }
	|
	expr TIMES expr { $$ = $1 * $3; }
	|
	expr DIVIDE expr { $$ = $1 / $3; }
	;

%%
