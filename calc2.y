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

exprs:
	| exprs expr EOL
	;

expr:
	literal | addition | subtraction | multiplication | division
	;

literal:
       NUMBER
       {
		puts("Got a number!");
       }
       ;

addition:
	NUMBER PLUS NUMBER
	{
		puts("Adding two numbers!");
	}
	;

subtraction:
	NUMBER MINUS NUMBER
	{
		puts("Subtracting a number from another!");
	}
	;

multiplication:
	NUMBER TIMES NUMBER
	{
		puts("Multiplying two numbers!");
	}
	;

division:
	NUMBER DIVIDE NUMBER
	{
		puts("Dividing a number by another!");
	}
	;

%%
