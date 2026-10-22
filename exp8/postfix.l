
%{
#include "y.tab.h"
#include <stdlib.h>
%}

%option noyywrap

%%

"++"        { return INCR; }
"--"        { return DECR; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"^"         { return POW; }
[ \t\n]+    ;
.           { return yytext[0]; }

%%
