%{
#include <stdio.h>
#include <stdlib.h>

int stack[100];
int top = -1;

void push(int n)
{
    stack[++top] = n;
}

int pop()
{
    return stack[top--];
}

int yylex();
int yyerror(char *s)
{
    printf("Invalid expression\n");
    return 0;
}
%}

%token NUMBER ADD SUB MUL DIV

%%

input:
      expression
      {
          if (top == 0)
              printf("Result = %d\n", stack[top]);
          else
              printf("Invalid postfix expression\n");
      }
      ;

expression:
      NUMBER
      {
          push($1);
      }
    | expression expression ADD
      {
          int b = pop();
          int a = pop();
          push(a + b);
      }
    | expression expression SUB
      {
          int b = pop();
          int a = pop();
          push(a - b);
      }
    | expression expression MUL
      {
          int b = pop();
          int a = pop();
          push(a * b);
      }
    | expression expression DIV
      {
          int b = pop();
          int a = pop();

          if (b == 0)
          {
              printf("Division by zero\n");
              exit(1);
          }

          push(a / b);
      }
    ;

%%

int main()
{
    printf("Enter postfix expression: ");
    yyparse();
    return 0;
}
