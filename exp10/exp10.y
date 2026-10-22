%{
/*
 * Experiment 10: Parser for "FOR" loop statements (YACC Parser)
 * CO Mapped: CO4
 */
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR TYPE ID NUM
%token LE GE EQ NE AND OR INC DEC
%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN

%right '=' ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN
%left OR
%left AND
%left EQ NE
%left '<' '>' LE GE
%left '+' '-'
%left '*' '/' '%'
%right '!'
%left INC DEC

%%

program:
      for_loop
    ;

for_loop:
      FOR '(' init ';' condition ';' update ')' body
      {
          printf("\nValid FOR loop statement!\n");
          return 0;
      }
    ;

init:
      /* empty */
    | TYPE id_list
    | expr_list
    ;

id_list:
      id_init
    | id_list ',' id_init
    ;

id_init:
      ID
    | ID '=' expr
    ;

expr_list:
      expr
    | expr_list ',' expr
    ;

condition:
      /* empty */
    | expr
    ;

update:
      /* empty */
    | expr_list
    ;

expr:
      ID
    | NUM
    | ID '=' expr
    | ID ADD_ASSIGN expr
    | ID SUB_ASSIGN expr
    | ID MUL_ASSIGN expr
    | ID DIV_ASSIGN expr
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | expr '%' expr
    | expr '<' expr
    | expr '>' expr
    | expr LE expr
    | expr GE expr
    | expr EQ expr
    | expr NE expr
    | expr AND expr
    | expr OR expr
    | '!' expr
    | ID INC
    | ID DEC
    | INC ID
    | DEC ID
    | '(' expr ')'
    ;

body:
      stmt
    | '{' stmt_list '}'
    | '{' '}'
    ;

stmt_list:
      stmt
    | stmt_list stmt
    ;

stmt:
      for_loop
    | expr ';'
    | ';'
    ;

%%

void yyerror(const char *s)
{
    printf("\nInvalid FOR loop statement!\n");
}

int main(void)
{
    printf("============================================================\n");
    printf("         Experiment 10: Parser for FOR Loop Statements       \n");
    printf("============================================================\n");
    printf("Enter a FOR loop statement:\n");

    yyparse();

    return 0;
}
