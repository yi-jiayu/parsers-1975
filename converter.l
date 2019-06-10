%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+                yylval.number=atoi(yytext); return NUMBER;
[IVXLCDM]             yylval.symbol=yytext[0]; return SYMBOL;
is	              return TOKIS;
"how much is"         return TOKHOWMUCH;
"how many Credits is" return TOKHOWMANYCREDITS;
\n                    return EOL;
\?                    return TOKQUERY;
Silver                return TOKSILVER;
Credits               return TOKCREDITS;
[a-z]+                yylval.string=strdup(yytext); return WORD;
%%

