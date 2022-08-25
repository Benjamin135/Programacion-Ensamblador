;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: inc.asm

segment .data
;aqui se declaran variables inicializadas
a	dq	0x0102030405060708
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;----------------
	mov eax, 1
	inc eax
	dec eax
	dec eax	;ZF = 1
	dec eax
	inc qword[a]
ret
	




