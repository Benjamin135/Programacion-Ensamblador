;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;file: call-ret.asm
	
segment .data
	
segment .bss

segment .text 
global main 					
main:
;----------------------
		nop
		nop
	CALL subrutina
ER1:	nop
		nop	
;----------------------
	CAll subrutina
ER2:	nop
		nop
		ret
		
;======================
;..........subrutina...
;ningun paso parametros

subrutina:
	nop	
	nop
	mov rax, 0
	RET
;======================


