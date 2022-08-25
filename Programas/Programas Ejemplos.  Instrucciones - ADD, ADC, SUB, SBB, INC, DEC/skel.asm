;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: memory.asm

;segment .data: dirección -> 0x403010

extern printf, scanf		

segment .data
a	db	128
b	db   19
		
segment .bss
c	resb 1

segment .text 
global main 					
main:
;---------------------------------------
	mov al, [a]
	add al, [b]
	mov [c], al
ret





