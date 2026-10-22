%{
#include <stdio.h>
#include <stdlib.h>

FILE *yyin;
%}

%%

[0-9]+    {
              int n = atoi(yytext);
              printf("%s -> %X\n", yytext, n);
          }

[ \t\n]+  ;

.         { printf("Invalid character: %s\n", yytext); }

%%

int main()
{
    yyin = fopen("input.txt", "r");

    if (yyin == NULL)
    {
        printf("Error opening file.\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}
