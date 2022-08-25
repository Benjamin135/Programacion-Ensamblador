;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)
;registro:
;nombres y apellidos:

;file: add1.asm

;..................
;#include <stdio.h>
;#include <stdint.h>

;int64_t x = 10;
;int64_t y = 20;
;int64_t z;

;int main ()
;{
;	z = x + y;	
;return 0;
;}
;..................

extern printf, scanf		

segment .data
x	dq  10
y	dq	20
	
segment .bss
z	resq  1

segment .text 

global main 					
main:
;------------
	mov rax, [x]
	add rax, [y]
	mov [z], rax
ret





