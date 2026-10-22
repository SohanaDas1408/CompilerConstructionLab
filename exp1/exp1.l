%{
/*
 * Experiment 1: Introduction to LEX tool, metadata and patterns.
 * CO Mapped: CO1
 *
 * Demonstrates:
 * 1. LEX Structure: Declarations, Rules, Auxiliary C code
 * 2. Regular Expressions & Patterns
 * 3. Lex Metadata: yytext, yyleng, yylex(), yywrap()
 */
#include <stdio.h>
#include <stdlib.h>

int vowels = 0;
int consonants = 0;
int digits = 0;
int operators = 0;
int punctuation = 0;
int special_chars = 0;
%}

%option noyywrap

%%

[ \t\n]+                { /* Ignore whitespace */ }

[0-9]+                  {
                            digits++;
                            printf("Token: NUMBER      | Lexeme: %-15s | Length: %d\n", yytext, yyleng);
                        }

[aAeEiIoOuU]            {
                            vowels++;
                            printf("Token: VOWEL       | Lexeme: %-15s | Length: %d\n", yytext, yyleng);
                        }

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {
                            consonants++;
                            printf("Token: CONSONANT   | Lexeme: %-15s | Length: %d\n", yytext, yyleng);
                        }

[+\-*/=<>!&|^%~]        {
                            operators++;
                            printf("Token: OPERATOR    | Lexeme: %-15s | Length: %d\n", yytext, yyleng);
                        }

[;,.:(){}\[\]]          {
                            punctuation++;
                            printf("Token: PUNCTUATION | Lexeme: %-15s | Length: %d\n", yytext, yyleng);
                        }

.                       {
                            special_chars++;
                            printf("Token: SPECIAL     | Lexeme: %-15s | Length: %d\n", yytext, yyleng);
                        }

%%

int main(void)
{
    printf("============================================================\n");
    printf("  Experiment 1: Introduction to LEX Tool, Metadata & Patterns\n");
    printf("============================================================\n");
    printf("Enter input text (Press Ctrl+D to finish):\n\n");

    yylex();

    printf("\n----------------------- Summary -----------------------------\n");
    printf("  Vowels matched       : %d\n", vowels);
    printf("  Consonants matched   : %d\n", consonants);
    printf("  Digits / Numbers     : %d\n", digits);
    printf("  Operators            : %d\n", operators);
    printf("  Punctuation marks    : %d\n", punctuation);
    printf("  Other characters     : %d\n", special_chars);
    printf("-------------------------------------------------------------\n");

    return 0;
}
