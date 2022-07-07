@echo off
"C:\Program Files (x86)\GnuWin32\bin\flex" analizador_lex_flex.l
echo "Flex ha compilado la especificacion lexica del archivo LexicoX.l (Se crea un archivo lex.yy.c)"
pause
c:\MinGW\bin\gcc.exe lex.yy.c -o analizador_lex_flex.exe
echo "Finalizado la ejecución del compilador de C sobre el archivo lex.yy.c (Se creo un archivo Compilado.exe)"
pause
analizador_lex_flex.exe input.txt
echo "Se ejecuto el analizador lexico sobre el archivo Ejemplo.txt"
del lex.yy.c
del analizador_lex_flex.exe
echo "Se borraron los archivos generados en todo este proceso, finalizado..."
pause