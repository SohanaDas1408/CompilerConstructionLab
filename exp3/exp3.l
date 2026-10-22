%{
#include<stdio.h>
int w= 0;
int n= 0;
%}

%%
[Aa][a-zA-Z]*/[^a-zA-Z]    { w++; }
[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?    { n++; }
[a-zA-Z]+    {}
.|\n    {}

%%
int main()
{
    printf("Enter text:\n");
    yylex();
    printf("\nWords starting with a or A= %d\n", w);
    printf("Numbers = %d\n", n);
    return 0;
}

int yywrap()
{
    return 1;
}
