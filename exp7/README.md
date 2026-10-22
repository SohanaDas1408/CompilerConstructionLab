# Experiment 7: Test Lines Ending with "COM"

**Course Outcome:** CO3

## 1. Objective
To write a LEX program that reads an input file (`input.txt`) and counts the total number of lines that end with `.com` or `.COM`.

## 2. Methodology
- Opens the input file `input.txt` with `yyin`.
- Uses pattern `.*\.[Cc][Oo][Mm][ \t]*\n` to match and count all lines ending with `.com` (case-insensitive).
- Uses `.*\n ;` to ignore other lines.

## 3. How to Compile and Run
```bash
lex com.l
gcc lex.yy.c -o com
./com
```
