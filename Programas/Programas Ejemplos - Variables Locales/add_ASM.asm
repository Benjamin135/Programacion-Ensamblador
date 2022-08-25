;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI (Application Binary Interface):
;rcx, rdx, r8, r9 	->   for integers 		   (left to right)-->> primeros 4 parametros enteros
;Remaining arguments are passed via the stack  (right to left)-->> [rsp+0x20],[rsp+0x28]......
;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:		-> 	 rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.					   	 
;VOLATILE(scratch): ->   rax, rcx, rdx, r8, r9, r10, r11
;Integers are returned in rax or rdx:rax.

;file: add_ASM.asm

;#include <stdio.h>
;#include <stdint.h>

;int64_t add(int64_t a, int64_t b);	//prototipo

;int64_t a = 10;		//def. variable global
;int64_t b = 20;
;int64_t suma;

;int main()
;{		
;	suma = add(a, b);
;	printf("suma = %lld\n", suma);
;	return 0;	
;}
;
;int64_t add(int64_t a, int64_t b)
;{
;	int64_t c;		//def. variable local
;	c = a + b;
;	return c;
;

extern printf, scanf		

segment .data
a	dq	10		;variales globales
b	dq	20	
msj	db	"suma = %d", 10, 0
		
segment .bss
suma	resq	1

segment .text 
global main 					
main:
		mov rcx, [a]
		mov rdx, [b]
		call add1
;-------------------
		mov rdx, rax
		mov rcx, msj
	sub rsp, 0x20
		call printf
	add rsp, 0x20
ret
;---------------------------------------
;..........subrutina....................	
add1:
;---- prologo -------
	push rbp
	mov rbp, rsp
	sub rsp, 0x10	 ;16 reserva espacio variables locales
		mov rax, rcx
		add rax, rdx
		
	mov [rbp-8], rax ;variable local
	mov rax, [rbp-8]
;---- epilogo -------	
	mov rsp, rbp
	pop rbp
ret




