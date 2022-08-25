;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;file: jump.asm
	
segment .data
	
segment .bss

segment .text 
global main 					
main:
;----------------------
		nop
		nop
	JMP subrutina	;llamada a la subrutina
ER1:	nop			;retorno de la subrutina
		nop
		
;-------------------------------------------
	JMP subrutina	;llamada a la subrutina
ER2:	nop			;retorno de la subrutina					
		nop
		ret
		
;======================
;..........subrutina...
;ningun paso parametros

subrutina:
	nop
	nop
	mov rax, 0
	JMP ER1
;======================	



