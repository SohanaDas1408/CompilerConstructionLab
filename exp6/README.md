# Experiment 6: Conversion of Decimal to Hexadecimal Number in a File

**Course Outcome:** CO2

## 1. Objective
To write a LEX program that reads decimal integers from an input file (`input.txt`) and converts each number into its hexadecimal equivalent.

## 2. Methodology
- Opens `input.txt` using `yyin = fopen("input.txt", "r")`.
- Matches sequence of digits using `[0-9]+`.
- Converts the string representation into an integer using `atoi(yytext)` and prints it in hexadecimal format using `printf("%s -> %X\n", yytext, n)`.

## 3. How to Compile and Run
```bash
lex decimal.l
gcc lex.yy.c -o decimal
./decimal
```
