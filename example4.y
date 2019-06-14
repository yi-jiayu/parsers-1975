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

%token NUMBER PLUS MINUS TIMES DIVIDE EOL

%%

exprs:
	| exprs expr EOL
	;

expr:
	literal | addition | subtraction | multiplication | division
	;

literal:
       NUMBER
       {
		printf("= %d\n", $1); // HL
       }
       ;

addition:
	NUMBER PLUS NUMBER
	{
		printf("= %d\n", $1 + $3); // HL
	}
	;

subtraction:
	NUMBER MINUS NUMBER
	{
		printf("= %d\n", $1 - $3); // HL
	}
	;

multiplication:
	NUMBER TIMES NUMBER
	{
		printf("= %d\n", $1 * $3); // HL
	}
	;

division:
	NUMBER DIVIDE NUMBER
	{
		printf("= %d\n", $1 / $3); // HL
	}
	;

%%
