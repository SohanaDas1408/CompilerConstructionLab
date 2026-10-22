# Experiment 5: Conversion of Lowercase to Uppercase and Vice Versa

**Course Outcome:** CO2

## 1. Objective
To write a LEX program that reads text and inverts the case of each alphabetic character: converting lowercase characters to uppercase, and uppercase characters to lowercase, while leaving other characters unchanged.

## 2. Methodology
- `[a-z]` pattern captures lowercase characters and transforms them using `toupper(yytext[0])`.
- `[A-Z]` pattern captures uppercase characters and transforms them using `tolower(yytext[0])`.
- `.` pattern echoes non-alphabetic characters unchanged.

## 3. How to Compile and Run
```bash
lex case.l
gcc lex.yy.c -o case
./case
```
