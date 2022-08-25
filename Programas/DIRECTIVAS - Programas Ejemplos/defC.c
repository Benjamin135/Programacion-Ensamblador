/* para mirar el codigo ensamblador generado por el compilador del lenguaje C,
usar la opción “-S” en la linea de comandos: gcc -O -S programa.c -masm=intel*/

/* gcc -O1 -o 001 001.c*/
//file: def.c

#include <stdio.h>

// código en lenguaje C

//----- 8 bits (byte) ----
unsigned char byte3=  255;
		 char byte2= -128;

unsigned char char1= 'A';
		 char char2= 'a';

//----- 16 bits (word) ------
unsigned short word1=  65535;
		 short word2= -32768;
		 
		 
//----- 32 bits (doubleword)----------
unsigned int doubleword2=  4294967295;
		 int doubleword1= -2147483648;

//----- 64 bits (quadword) -------------------------
unsigned long long quadword2 = 0x1234567890abcdef;
unsigned long long quadword3 = 18446744073709551615;
		 long long quadword1 = -9223372036854775808;
		 
	char cadena_hola[] = "Hola";


int main()
{

return 0;
}








