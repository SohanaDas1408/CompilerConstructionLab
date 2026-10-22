%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER ADD SUB MUL DIV POW INCR DECR

%%

input:
      expression
      {
          printf("Result = %d\n", $1);
      }
    ;

expression:
      NUMBER
      {
          $$ = $1;
      }
    | expression expression ADD
      {
          $$ = $1 + $2;
      }
    | expression expression SUB
      {
          $$ = $1 - $2;
      }
    | expression expression MUL
      {
          $$ = $1 * $2;
      }
    | expression expression DIV
      {
          if ($2 == 0)
          {
              yyerror("Division by zero");
              YYABORT;
          }
          $$ = $1 / $2;
      }
    | expression expression POW
      {
          $$ = (int)pow($1, $2);
      }
    | expression INCR
      {
          $$ = $1 + 1;
      }
    | expression DECR
      {
          $$ = $1 - 1;
      }
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main(void)
{
    printf("Enter a postfix expression:\n");
    yyparse();
    return 0;
}
