# Compiler Construction Laboratory

This repository contains implementations of all 10 laboratory practical experiments for the **Compiler Construction Lab** course using **LEX / Flex** and **YACC / Bison**.

---

## List of Practical Experiments

| S. No | CO Mapped | Name of the Experiment | Directory | Tools Used |
| :---: | :---: | :--- | :---: | :---: |
| **1** | **CO1** | Introduction to LEX tool, metadata and patterns. | [`exp1/`](./exp1) | LEX / GCC |
| **2** | **CO1** | Count the number of comments, keywords, identifiers, words, lines and spaces from input file. | [`exp2/`](./exp2) | LEX / GCC |
| **3** | **CO1** | Count number of words starting with “A”. | [`exp3/`](./exp3) | LEX / GCC |
| **4** | **CO2** | Introduction to YACC tool, and format to write YACC code. | [`exp4/`](./exp4) | LEX / YACC / GCC |
| **5** | **CO2** | Conversion of lowercase to uppercase and vice versa. | [`exp5/`](./exp5) | LEX / GCC |
| **6** | **CO2** | Conversion of decimal to hexadecimal number in a file. | [`exp6/`](./exp6) | LEX / GCC |
| **7** | **CO3** | Test lines ending with “COM”. | [`exp7/`](./exp7) | LEX / GCC |
| **8** | **CO3** | Postfix Expression Evaluation. | [`exp8/`](./exp8) | LEX / YACC / GCC |
| **9** | **CO4** | Desk calculator with error recovery. | [`exp9/`](./exp9) | LEX / YACC / GCC |
| **10** | **CO4** | Parser for “FOR” loop statements. | [`exp10/`](./exp10) | LEX / YACC / GCC |

---

## Prerequisites & Installation

To run these programs on Ubuntu / Debian / WSL:

```bash
sudo apt update
sudo apt install -y flex bison gcc build-essential
```

---

## How to Run Each Experiment

### Experiment 1: Introduction to LEX tool, metadata and patterns
```bash
cd exp1
lex exp1.l
gcc lex.yy.c -o exp1
./exp1
```

### Experiment 2: Count comments, keywords, identifiers, words, lines and spaces
```bash
cd exp2
lex exp2.l
gcc lex.yy.c -o exp2
./exp2 input.c
```

### Experiment 3: Count words starting with "A"
```bash
cd exp3
lex exp3.l
gcc lex.yy.c -o exp3
./exp3
```

### Experiment 4: Introduction to YACC tool & expression parsing
```bash
cd exp4
yacc -d exp4.y
lex exp4.l
gcc y.tab.c lex.yy.c -o exp4
./exp4
```

### Experiment 5: Conversion of lowercase to uppercase and vice versa
```bash
cd exp5
lex case.l
gcc lex.yy.c -o case
./case
```

### Experiment 6: Conversion of decimal to hexadecimal in a file
```bash
cd exp6
lex decimal.l
gcc lex.yy.c -o decimal
./decimal
```

### Experiment 7: Test lines ending with "COM"
```bash
cd exp7
lex com.l
gcc lex.yy.c -o com
./com
```

### Experiment 8: Postfix expression evaluation
```bash
cd exp8
yacc -d postfix.y
lex postfix.l
gcc y.tab.c lex.yy.c -o postfix -lm
./postfix
```

### Experiment 9: Desk calculator with error recovery
```bash
cd exp9
yacc -d calc.y
lex calc.l
gcc y.tab.c lex.yy.c -o calc -lm
./calc
```

### Experiment 10: Parser for "FOR" loop statements
```bash
cd exp10
yacc -d exp10.y
lex exp10.l
gcc y.tab.c lex.yy.c -o exp10
./exp10
```

---

## Author
- **Sohana Das** ([@SohanaDas1408](https://github.com/SohanaDas1408))
