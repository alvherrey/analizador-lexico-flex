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
CONST_CADENA    \"[^\n"]*\"

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
{FIN_SENTENCIA}             {printf("\nFIN_SENTENCIA        %s      %d", yytext, yylineno);}
{COMA}                      {printf("\nCOMA                 %s      %d", yytext, yylineno);}
{PUNTOYCOMA}                {printf("\nPUNTOYCOMA           %s      %d", yytext, yylineno);}
{INTEGER}                   {printf("\nCONST_INTEGER        %s      %d", yytext, yylineno);}
{FLOAT}                     {printf("\nCONST_FLOAT          %s      %d", yytext, yylineno);}
{STRING}                    {printf("\nCONST_CADENA         %s      %d", yytext, yylineno);}

{SUMA}                      {printf("\nSUMA                 %s      %d", yytext, yylineno);}
{RESTA}                     {printf("\nRESTA                %s      %d", yytext, yylineno);}
{MULT}                      {printf("\nMULT                 %s      %d", yytext, yylineno);}
{DIV}                       {printf("\nDIV                  %s      %d", yytext, yylineno);}
{IGUAL}                     {printf("\nIGUAL                %s      %d", yytext, yylineno);}
{MAYOR}                     {printf("\nMAYOR                %s      %d", yytext, yylineno);}
{MENOR}                     {printf("\nMENOR                %s      %d", yytext, yylineno);}
{MAYORIGUAL}                {printf("\nMAYORIGUAL           %s      %d", yytext, yylineno);}
{MENORIGUAL}                {printf("\nMENORIGUAL           %s      %d", yytext, yylineno);}
{COMP_IGUAL}                {printf("\nOP_COMP_IGUAL        %s      %d", yytext, yylineno);}
{NEGACION}                  {printf("\nOP_NEGACION          %s      %d", yytext, yylineno);}
{DISTINTO}                  {printf("\nOP_DISTINTO          %s      %d", yytext, yylineno);}
{DOSPUNTOS}                 {printf("\nOP_DOSPUNTOS         %s      %d", yytext, yylineno);}
{LLAVE_A}                   {printf("\nLLAVE_A              %s      %d", yytext, yylineno);}
{LLAVE_C}                   {printf("\nLLAVE_C              %s      %d", yytext, yylineno);}             
{PARENTESIS_A}              {printf("\nPARENTESIS_A         %s      %d", yytext, yylineno);}
{PARENTESIS_C}              {printf("\nPARENTESIS_C         %s      %d", yytext, yylineno);}

{IF}                        {printf("\nRESERVADA_IF:        %s      %d", yytext, yylineno);}
{WHILE}                     {printf("\nRESERVADA_WHILE:     %s      %d", yytext, yylineno);}
{INTEGER}                   {printf("\nRESERVADA_INTEGER:   %s      %d", yytext, yylineno);}
{FLOAT}                     {printf("\nRESERVADA_FLOAT:     %s      %d", yytext, yylineno);}
{WRITE}                     {printf("\nRESERVADA_WRITE:     %s      %d", yytext, yylineno);}
{DECVAR}                    {printf("\nRESERVADA_DECVAR:    %s      %d", yytext, yylineno);}
{ENDDEC}                    {printf("\nRESERVADA_ENDDEC:    %s      %d", yytext, yylineno);}
{FLOAT}                     {printf("\nRESERVADA_FLOAT:     %s      %d", yytext, yylineno);}
{INTEGER}                   {printf("\nRESERVADA_INTEGER:   %s      %d", yytext, yylineno);}

{IDENTIFICADOR}             {printf("\nIDENTIFICADOR        %s      %d", yytext, yylineno);}
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