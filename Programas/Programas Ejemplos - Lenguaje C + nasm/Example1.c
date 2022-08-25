//;assemble, link and run with 
//;Assemble: nasm -f win32 -o Example1.o Example1.asm 
//;Link:     gcc -o Example1 Example1.c Example1.o
//;Run:		 Example1
//;%%%%%%%%%%%%%%%%%%%%%%%
//;---------------------------------------

//file: Example1.c

// calcular d = (a + b) * c

#include <stdio.h>

extern long long calcular(long long a, long long b, long long c); // declara la funcion como definida externamente

int main()
{
	long long a = 30;	// int64_t a = 30;
	long long b = 20;	// int64_t b = 20;
	long long c = 10;	// int64_t b = 10;
	long long d = calcular(a, b, c);

	printf("a: %d b: %d c: %d\n", a, b, c);
	printf("d: %d\n", d);
	return 0;
}

