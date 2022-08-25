;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ical.asm

;segment .data: dirección -> 0x403010

segment .data
a	db	0x83	;SS= 131		CS= -125
b	db  0x92	;SS= 146		CS= -110

;SS -> c = a+b =  277
;CS -> c = a+b = -235		
		
segment .bss
c	resb 1

segment .text 
global main 					
main:
;--------------------------------------------------

;instrucción "ADD"   memónico -> ADD

;etiqueta:	instr. destino, fuente		;comentario
;				 destino <<-- fuente

;		1.)	 ADD  	reg, inm
;		2.)  ADD  	mem, inm
;		3.)  ADD  	reg, reg
;		4.)  ADD  	reg, mem
;		5.)  ADD  	mem, reg
;----------------------------------------------------
;--------------
	mov al, [a]
	add al, [b]		;al=0x15		-> CF=1, CZ=0, SF=0, OF=1
	mov [c], al		
;SS=  277	-> CF=1 -> "OVERFLOW" error resultado suma c= 0x15 =  21
;CS= -235	-> OF=1 -> "OVERFLOW" error resultado suma c= 0x15 = +21
ret

;			1  0
; 0x83 =	   1000_0011
; 0x92 =  +)   1001_0010	
;			   ---------
; carry -> 	1  0001_0101		-> CF=1, CZ=0, SF=0, OF=1
