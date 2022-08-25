;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: HolaMundo.asm

extern printf, scanf, ExitProcess	

;directivas a usar:
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;& DB:-->> define una variable de tipo byte, 8 bits.								&
;& DW:-->> define una variable de tipo palabra (word), 2 bytes = 16 bits.			&
;& DD:-->> define una variable de tipo doble palabra (double word), 2 palabras =	&
;&	  	   4 bytes = 32 bits.														&
;& DQ:-->> define una variable de tipo cu?uple palabra (quad word), 4 palabras	&
;&	       = 8 bytes = 64 bits.														&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

segment .data
msj db "Hola Mundo!", 0x0a, 0

;.data -> direccion memoria: 0x403010
;ver en memoria codificación ASCII de -> Hola Mundo!
segment .bss

segment .text 
global main 					
main:
;---------------------------------------	
;muestra consola mensaje HolaMundo!	
	mov rcx, msj; 1 parametro para printf
	call printf
call ExitProcess





