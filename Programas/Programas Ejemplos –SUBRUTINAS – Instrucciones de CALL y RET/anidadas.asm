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
	CALL subrutina1	;llamada a la subrutina
		nop			;retorno de la subrutina
		nop
		RET

;-----------------------
;..........subrutinas...
;ningun paso parametros
;=======================
subrutina1:
	nop
	nop
CALL subrutina2
	nop
	nop
	mov rax, 0
	RET
;=============================	
		subrutina2:
					nop
					nop
					mov rax, 0
					RET
;=============================	



