/* para mirar el codigo ensamblador generado por el compilador del lenguaje C,
usar la opción “-S” en la linea de comandos: gcc -O -S programa.c -masm=intel*/

/* gcc -O0 -o 001 001.c*/
//file: ia32C1.asm

#include <stdio.h>

//código en lenguaje C
int a =  5;
int b = 10;
int c;
int NEGATIVO;

int main() 
{
	c = a - b;
	if (c < 0)
	
	{NEGATIVO = c;}
	
return 0;

}














