# Experiment 2: Count Comments, Keywords, Identifiers, Words, Lines, and Spaces

**Course Outcome:** CO1

## 1. Objective
To write a LEX program that reads an input C file and counts:
- Comments (single-line `//` and multi-line `/* ... */`)
- Keywords
- Identifiers
- Total words
- Total lines
- Total spaces (including tabs)

## 2. Methodology
- Uses start conditions (`%x MULTI_COMMENT`) in Lex to accurately handle multi-line comments spanning across lines.
- Identifies C keywords using reserved word pattern matching.
- Identifies identifiers following the standard naming convention: `[a-zA-Z_][a-zA-Z0-9_]*`.
- Accurately tracks newlines (`\n`) and space characters (` ` and `\t`).

## 3. How to Compile and Run
```bash
lex exp2.l
gcc lex.yy.c -o exp2
./exp2 input.c
```
