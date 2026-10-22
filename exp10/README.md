# Experiment 10: Parser for "FOR" Loop Statements

**Course Outcome:** CO4

## 1. Objective
To construct a syntax-directed parser using LEX and YACC that validates the syntactic structure of C/C++ style `for` loops.

## 2. Syntax Supported
The parser validates `for` loop constructs conforming to:
```c
for (init; condition; update) body
```
Where:
- `init`: Can be empty, variable declaration (e.g. `int i = 0`), or assignment expressions (`i = 0, j = 10`).
- `condition`: Can be empty, relational comparison (`i < n`, `i <= 10 && j > 0`), or boolean expressions.
- `update`: Can be empty, increment/decrement (`i++`, `++i`), compound assignments (`i += 2`), or comma-separated updates (`i++, j--`).
- `body`: Can be an empty statement (`;`), a single statement (`x = x + 1;`), or a compound block (`{ ... }`).

## 3. How to Compile and Run
```bash
yacc -d exp10.y
lex exp10.l
gcc y.tab.c lex.yy.c -o exp10
./exp10
```

## 4. Sample Test Cases
### Valid Inputs:
```c
for (i = 0; i < 10; i++) { count++; }
```
```c
for (int i = 0, j = 10; i < j; i++, j--) x = x + 1;
```
```c
for (;;) ;
```

### Invalid Inputs:
```c
for (i = 0; i < 10 i++)
```
*(Missing semicolon causes syntax error)*
