;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;file: anidadas.asm

;subrutinas anidadas
	
segment .data
	
segment .bss

segment .text 
global main 					
main:
;----------------------
		nop			;paso parametros (valor o referencia)
		nop
	CALL subrutina1	;llamada a la subrutina1
		nop			;retorno de la subrutina1
		nop
		RET

;-----------------------
;.......subrutinas......

;=======================
subrutina1:
	nop				;paso parametros (valor o referencia)
	nop
CALL subrutina2		;llamada a la subrutina2
	nop				;retorno de la subrutina2
	nop
	mov rax, 0
	RET				;retorno a main
;=============================	
		subrutina2:
					nop
					nop
					mov rax, 0
					RET		;retorno a la subrutina1
;=============================	



