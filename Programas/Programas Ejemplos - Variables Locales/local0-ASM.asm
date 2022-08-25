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

;file: %1.asm

;.text=   0X004016E0
;.data=   0x00403000

;#include <stdio.h>
;#include <stdint.h>
;int64_t local();	//prototipo
;int main()
;{
;	local();
;	return 0;	
;}
;//--------- funcion -------
;int64_t local()
;{
;	int64_t a;		//a -> def. variable local
;	a = 10;
;	a = a + 20;
;	return a;
;}
	
extern printf, scanf		

segment .data

segment .bss

segment .text 

global main 					
main:
;----------------------
	call local1
ret
;-----------------------

;.......subrutina.......
local1:
;------- prologo ------
		push rbp
		mov rbp, rsp
		sub rsp, 8	;reserva espacio variable local
		;------------------------------------------	
		mov qword[rbp-8], 10		;a=10
		add qword[rbp-8], 20		;a=a+20
		mov rax, [rbp-8]
		;--------------------------------------------
;------- epilogo -----		
		mov rsp, rbp
		pop rbp
		ret
		
		
		
		


