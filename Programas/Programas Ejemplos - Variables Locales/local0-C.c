

/* To see the assembly code generated by the C compiler, we can use the �-S� option on the command line: gcc -O -S programa.c -masm=intel*/
/* If we use the �-c� command line option, GCC will both compile and assemble the code: gcc -O2 -c code.c*/
/* To inspect the contents of object code files,: objdump -d code.o*/

/* gcc -Wall -o C001 C001.c */
/* x86_64-w64-mingw32-gcc.exe -o %1.exe %1.o */

#include <stdio.h> 

/* para mirar el codigo ensamblador generado por el compilador del lenguaje C, ,podemos usar la opci�n �-S� en la linea de comandos: gcc -O -S programa.c -masm=intel*/


/* gcc -o 001 001.c*/


#include <stdio.h>
#include <stdint.h>

int64_t x = 10;	//global

int64_t local1();	//prototipo

int main()
{
	local1();
	return 0;	
}

//--------- funcion -------
int64_t local1()
{
	int64_t a;		//a -> def. variable local
	a = 10;
	a = a + 20;
	return a;
}
	


