# Experiment 9: Desk Calculator with Error Recovery

**Course Outcome:** CO4

## 1. Objective
To build an interactive desk calculator using LEX and YACC that supports floating-point arithmetic, precedence, unary minus, power, increment/decrement, and implements error recovery using YACC's `error` token and `yyerrok` macro.

## 2. Methodology & Error Recovery
- Uses `%union` to support `double` precision arithmetic.
- Incorporates operator precedence:
  - `%left '+' '-'`
  - `%left '*' '/'`
  - `%right UMINUS`
  - `%right '^'`
  - `%left INCR DECR`
- Error recovery is achieved through the rule:
  ```yacc
  line: error '\n'
        {
            printf("Syntax error! Please try again.\n");
            calc_error = 0;
            yyerrok;
        }
  ```
  When an invalid expression is encountered, the parser catches the error, outputs an error message, and `yyerrok` resets the parser state so subsequent lines can be parsed without aborting.

## 3. How to Compile and Run
```bash
yacc -d calc.y
lex calc.l
gcc y.tab.c lex.yy.c -o calc -lm
./calc
```
