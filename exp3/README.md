# Experiment 3: Count Number of Words Starting with "A"

**Course Outcome:** CO1

## 1. Objective
To write a LEX program that counts the number of words starting with either lowercase 'a' or uppercase 'A', as well as numbers in the given input.

## 2. Methodology
- Uses the pattern `[Aa][a-zA-Z]*/[^a-zA-Z]` to identify words starting with 'A' or 'a'.
- Uses trailing context `/` so that non-alphabet boundary characters are not consumed.
- Uses `[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?` to identify integer and floating-point numbers.

## 3. How to Compile and Run
```bash
lex exp3.l
gcc lex.yy.c -o exp3
./exp3
```
