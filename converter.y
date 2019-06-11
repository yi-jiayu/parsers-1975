%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *str)
{
	puts("I have no idea what you are talking about");
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

%token TOKIS TOKHOWMUCH TOKCREDITS TOKHOWMANYCREDITS EOL TOKQUERY TOKSILVER;

%union 
{
	int number;
	char symbol;
	char *string;
}

%token <number> NUMBER
%token <symbol> SYMBOL
%token <string> WORD

%%

commands:
	| commands command EOL
	;


command:
	define_symbol | define_conversion | query_value | query_credits | error

define_symbol:
	WORD TOKIS SYMBOL
	{
		printf("Defining %s to be the symbol %c\n", $1, $3);
	}
	;

define_conversion:
	WORD TOKSILVER TOKIS NUMBER TOKCREDITS
	{
		printf("Defining %s Silver to be worth %d Credits\n", $1, $4);
	}
	;

query_value:
	TOKHOWMUCH WORD TOKQUERY
	{
		printf("Asking for value of %s\n", $2);
	}
	;

query_credits:
	TOKHOWMANYCREDITS WORD TOKSILVER TOKQUERY
	{
		printf("Asking for value of %s in Credits\n", $2);
	}
	;

%%
