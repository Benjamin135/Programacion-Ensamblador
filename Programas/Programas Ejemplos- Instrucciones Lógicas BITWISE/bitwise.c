/* para mirar el codigo ensamblador generado por el compilador del lenguaje C,
usar la opción “-S” en la linea de comandos: gcc -O -S programa.c -masm=intel*/

/* gcc -O0 -o 001 001.c*/
//file: ia32logicas.c

#include <stdio.h>

// código en lenguaje C
int a, b, c; 
a=  27;	//a: variable global
b= 541;	//b: variable global

int main() 
{
  c = a & b;
  c = a | b;
  c = a ^ b;
  c = ~ a;
  
  return 0;
}









