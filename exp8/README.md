# Experiment 8: Postfix Expression Evaluation

**Course Outcome:** CO3

## 1. Objective
To construct a syntax-directed postfix expression evaluator using LEX and YACC supporting arithmetic operations (`+`, `-`, `*`, `/`, `^`) as well as increment (`++`) and decrement (`--`) operators.

## 2. Methodology
- Postfix (Reverse Polish Notation) expressions place operators after their operands.
- The grammar parses:
  - `expression expression ADD` -> evaluates to `$1 + $2`
  - `expression expression SUB` -> evaluates to `$1 - $2`
  - `expression expression MUL` -> evaluates to `$1 * $2`
  - `expression expression DIV` -> evaluates to `$1 / $2` (with division-by-zero check)
  - `expression expression POW` -> evaluates to `pow($1, $2)`
  - `expression INCR` -> evaluates to `$1 + 1`
  - `expression DECR` -> evaluates to `$1 - 1`

## 3. How to Compile and Run
```bash
yacc -d postfix.y
lex postfix.l
gcc y.tab.c lex.yy.c -o postfix -lm
./postfix
```

## 4. Sample Test Cases
- Input: `5 3 + 2 *` -> Output: `Result = 16`
- Input: `2 3 ^` -> Output: `Result = 8`
- Input: `9 ++` -> Output: `Result = 10`
