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
		nop				;paso parametros (valor o referencia)
		nop
	CALL subrutina		;llamada a la subrutina
ER1:	nop
		nop	
;----------------------
		nop				;paso parametros (valor o referencia)
		nop
	CAll subrutina		;llamada a la subrutina
ER2:	nop
		nop
		ret
		
;=======================
;.......subrutina.......
;paso parametros

subrutina:
	nop	
	nop
	mov rax, 0
	RET			;retorno 
;=======================


