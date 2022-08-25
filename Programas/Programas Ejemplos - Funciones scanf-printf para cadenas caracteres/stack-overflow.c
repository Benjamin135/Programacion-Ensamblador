/* To see the assembly code generated by the C compiler, we can use the �-S� option on the command line: gcc -O -S programa.c -masm=intel*/
/* If we use the �-c� command line option, GCC will both compile and assemble the code: gcc -O2 -c code.c*/
/* To inspect the contents of object code files,: objdump -d code.o*/

/* gcc  -o HelloCC HelloCC.c */
 
// file : stack-overflow.c

# include <stdio.h>

int main ()
{
	
char cadena[4];
	
	printf("ingresar cadena: ");
	scanf("%s", &cadena); 
	printf("cadena ingresada: %s\n", cadena);
	
return 0;
}

//cadena = abcdefghijk	 -> OK
//cadena = abcdefghijkl  -> STACK-OVERFLOW