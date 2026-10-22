# Experiment 4: Introduction to YACC Tool, and Format to Write YACC Code

**Course Outcome:** CO2

## 1. Objective
To understand the structure, syntax, and format of a YACC (Yet Another Compiler Compiler) grammar file, and parse arithmetic expressions using Lex and Yacc.

## 2. Structure of a YACC File
A YACC specification file consists of three sections separated by `%%`:

```yacc
%{
    /* Section 1: C Declarations, header files, and function prototypes */
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    int yyerror(char *s);
%}

/* Declarations: Tokens, Operator Precedence, Associativity */
%token NUM ID

%%
/* Section 2: Grammar Rules & Actions */
E : E '+' T   { /* action */ }
  | T
  ;
T : T '*' F
  | F
  ;
F : '(' E ')'
  | NUM
  | ID
  ;
%%
/* Section 3: Auxiliary C Code */
int main() {
    yyparse();
    return 0;
}
```

## 3. How to Compile and Run
```bash
yacc -d exp4.y
lex exp4.l
gcc y.tab.c lex.yy.c -o exp4
./exp4
```
