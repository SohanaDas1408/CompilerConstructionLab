
%{
#include "y.tab.h"
#include <stdlib.h>
%}

%option noyywrap

%%

"++"                    { return INCR; }
"--"                    { return DECR; }

[0-9]+(\.[0-9]+)?       {
                            yylval.num = atof(yytext);
                            return NUMBER;
                        }

[ \t]+                  ;
\n                      { return '\n'; }

.                       { return yytext[0]; }

%%
