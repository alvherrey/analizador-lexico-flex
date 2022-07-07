%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
FILE *yyin;
%}

%option noyywrap
%option yylineno

/* Tocke */
DIGITO          [0-9]
LETRA           [a-zA-Z]
ESPACIO         [" "]
INI_COMENTARIO  ["/*"]
FIN_COMENTARIO  ["*/"]
GUIONES         [-_]
COMA            [","]
CHAR_PUNTO      ["."]
PUNTOYCOMA      [";"]
CHAR_DOSPUNTOS  [":"]

IDENTIFICADOR   {LETRA}({LETRA}|{DIGITO}|{GUIONES})*
CONST_INTEGER   (-?[1-9][0-9]{0,4})|0
CONST_FLOAT     {DIGITO}{0,8}{CHAR_PUNTO}{DIGITO}{1,8}
STRING          \"[^\n"]*\"

/* Operadores lógicos y operadores aritméticos básicos */
SUMA            ["+"]
RESTA           ["-"]
MULT            ["*"]
DIV             ["/"]
IGUAL           ["="]
MAYOR           [">"]
MENOR           ["<"]
MAYORIGUAL      ">="
MENORIGUAL      "<="
COMP_IGUAL      "=="
NEGACION        "!"
DISTINTO        "!="
DOSPUNTOS       [":"]
LLAVE_A         ["{"]
LLAVE_C         ["}"]
PARENTESIS_A    ["("]
PARENTESIS_C    [")"]
FIN_SENTENCIA   [";"]

/* Palabras reservadas */
IF              "if"|"IF"
WHILE           "while"|"WHILE"
DECVAR          "DECVAR"
ENDDEC          "ENDDEC"
INTEGER         "INTEGER"|"Integer"
FLOAT           "Float"|"FLOAT"
WRITE           "write"|"WRITE"

/* REGLAS*/
%%
{FIN_SENTENCIA}             {printf("\n%d   FIN_SENTENCIA        %s", yylineno, yytext );}
{COMA}                      {printf("\n%d   COMA                 %s", yylineno, yytext);}
{PUNTOYCOMA}                {printf("\n%d   PUNTOYCOMA           %s", yylineno, yytext );}
{INTEGER}                   {printf("\n%d   CONST_INTEGER        %s", yylineno, yytext );}
{FLOAT}                     {printf("\n%d   CONST_FLOAT          %s", yylineno, yytext );}
{STRING}                    {printf("\n%d   CONST_CADENA         %s", yylineno, yytext );}
{SUMA}                      {printf("\n%d   SUMA                 %s", yylineno, yytext );}
{RESTA}                     {printf("\n%d   RESTA                %s", yylineno, yytext );}
{MULT}                      {printf("\n%d   MULT                 %s", yylineno, yytext );}
{DIV}                       {printf("\n%d   DIV                  %s", yylineno, yytext );}
{IGUAL}                     {printf("\n%d   IGUAL                %s", yylineno, yytext );}
{MAYOR}                     {printf("\n%d   MAYOR                %s", yylineno, yytext );}
{MENOR}                     {printf("\n%d   MENOR                %s", yylineno, yytext );}
{MAYORIGUAL}                {printf("\n%d   MAYORIGUAL           %s", yylineno, yytext );}
{MENORIGUAL}                {printf("\n%d   MENORIGUAL           %s", yylineno, yytext );}
{COMP_IGUAL}                {printf("\n%d   OP_COMP_IGUAL        %s", yylineno, yytext );}
{NEGACION}                  {printf("\n%d   OP_NEGACION          %s", yylineno, yytext );}
{DISTINTO}                  {printf("\n%d   OP_DISTINTO          %s", yylineno, yytext );}
{DOSPUNTOS}                 {printf("\n%d   OP_DOSPUNTOS         %s", yylineno, yytext );}
{LLAVE_A}                   {printf("\n%d   LLAVE_A              %s", yylineno, yytext );}
{LLAVE_C}                   {printf("\n%d   LLAVE_C              %s", yylineno, yytext );}             
{PARENTESIS_A}              {printf("\n%d   PARENTESIS_A         %s", yylineno, yytext );}
{PARENTESIS_C}              {printf("\n%d   PARENTESIS_C         %s", yylineno, yytext );}

{IF}                        {printf("\n%d   RESERVADA_IF:        %s", yylineno, yytext );}
{WHILE}                     {printf("\n%d   RESERVADA_WHILE:     %s", yylineno, yytext );}
{INTEGER}                   {printf("\n%d   RESERVADA_INTEGER:   %s", yylineno, yytext );}
{FLOAT}                     {printf("\n%d   RESERVADA_FLOAT:     %s", yylineno, yytext );}
{WRITE}                     {printf("\n%d   RESERVADA_WRITE:     %s", yylineno, yytext );}
{DECVAR}                    {printf("\n%d   RESERVADA_DECVAR:    %s", yylineno, yytext );}
{ENDDEC}                    {printf("\n%d   RESERVADA_ENDDEC:    %s", yylineno, yytext );}
{FLOAT}                     {printf("\n%d   RESERVADA_FLOAT:     %s", yylineno, yytext );}
{INTEGER}                   {printf("\n%d   RESERVADA_INTEGER:   %s", yylineno, yytext );}

{IDENTIFICADOR}             {printf("\n%d   IDENTIFICADOR        %s", yylineno, yytext );}
%%

int main (int argc, char *argv[]){
    /*Abro el archivo en modo lectura y dejo apuntando el puntero yyvin que nos pide FLEX alli.*/
    if((yyin = fopen(argv[1], "rt")) ==  NULL){
        printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
        return 1;
    } 
    else{
        printf("\nEl archivo %s se abrio correctamente\n", argv[1]);
        yylex();
    }
    printf("\nFLEX finalizo la lectura del archivo %s \n", argv[1]);
    fclose(yyin);
    return 0;
}