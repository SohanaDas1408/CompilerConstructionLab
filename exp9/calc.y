
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex(void);
void yyerror(const char *s);

int calc_error = 0;

void yyerror(const char *s)
{
    /* Error recovery is handled by the grammar */
}
%}

%union {
    double num;
}

%token <num> NUMBER
%token INCR DECR
%type <num> expr

%left '+' '-'
%left '*' '/'
%right UMINUS
%right '^'
%left INCR DECR

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'
      {
          if (!calc_error)
              printf("Result = %g\n", $1);

          calc_error = 0;
      }
    | error '\n'
      {
          printf("Syntax error! Please try again.\n");
          calc_error = 0;
          yyerrok;
      }
    ;

expr:
      NUMBER
      {
          $$ = $1;
      }
    | expr '+' expr
      {
          $$ = $1 + $3;
      }
    | expr '-' expr
      {
          $$ = $1 - $3;
      }
    | expr '*' expr
      {
          $$ = $1 * $3;
      }
    | expr '/' expr
      {
          if ($3 == 0)
          {
              printf("Error: Division by zero!\n");
              calc_error = 1;
              $$ = 0;
          }
          else
              $$ = $1 / $3;
      }
    | expr '^' expr
      {
          $$ = pow($1, $3);
      }
    | expr INCR
      {
          $$ = $1 + 1;
      }
    | expr DECR
      {
          $$ = $1 - 1;
      }
    | '(' expr ')'
      {
          $$ = $2;
      }
    | '-' expr %prec UMINUS
      {
          $$ = -$2;
      }
    ;

%%

int main(void)
{
    printf("DESK CALCULATOR\n");
    printf("Operators: + - * / ^ ++ -- ()\n");
    printf("Enter one expression per line.\n");
    printf("Press Ctrl+D to exit.\n\n");

    yyparse();
    return 0;
}
