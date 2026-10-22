%{
/*
 * Experiment 2: Count the number of comments, keywords, identifiers,
 *               words, lines and spaces from an input file.
 * CO Mapped: CO1
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int comment_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int word_count = 0;
int line_count = 1; /* Start at line 1 */
int space_count = 0;
%}

%option noyywrap
%x MULTI_COMMENT

%%

"//".*                  {
                            comment_count++;
                        }

"/*"                    {
                            BEGIN(MULTI_COMMENT);
                        }

<MULTI_COMMENT>"*/"     {
                            comment_count++;
                            BEGIN(INITIAL);
                        }

<MULTI_COMMENT>\n       {
                            line_count++;
                        }

<MULTI_COMMENT>[ \t]    {
                            space_count++;
                        }

<MULTI_COMMENT>.        ;

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
                            keyword_count++;
                            word_count++;
                        }

[a-zA-Z_][a-zA-Z0-9_]*  {
                            identifier_count++;
                            word_count++;
                        }

[0-9]+(\.[0-9]+)?       {
                            word_count++;
                        }

\"(\\.|[^\\"])*\"       {
                            /* String literal counts as a word */
                            word_count++;
                        }

[ ]                     {
                            space_count++;
                        }

\t                      {
                            space_count++;
                        }

\n                      {
                            line_count++;
                        }

.                       ;

%%

int main(int argc, char **argv)
{
    const char *filename = "input.c";

    if (argc > 1) {
        filename = argv[1];
    }

    yyin = fopen(filename, "r");
    if (!yyin) {
        printf("Error: Cannot open input file '%s'\n", filename);
        printf("Usage: ./exp2 [filename]\n");
        return 1;
    }

    printf("Analyzing file: %s ...\n\n", filename);
    yylex();
    fclose(yyin);

    printf("============================================================\n");
    printf("                  Analysis Results                          \n");
    printf("============================================================\n");
    printf("  Total Comments    : %d\n", comment_count);
    printf("  Total Keywords    : %d\n", keyword_count);
    printf("  Total Identifiers : %d\n", identifier_count);
    printf("  Total Words       : %d\n", word_count);
    printf("  Total Lines       : %d\n", line_count);
    printf("  Total Spaces      : %d\n", space_count);
    printf("============================================================\n");

    return 0;
}
