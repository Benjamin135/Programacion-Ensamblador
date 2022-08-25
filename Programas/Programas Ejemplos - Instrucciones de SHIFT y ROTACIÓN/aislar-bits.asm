;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;aislar parte de un byte, word, ...
;ej. aislar bits 3, 4 y 5

;file: aislar-bits.asm

extern printf, scanf		

segment .data
numero	DB	0xB9	;0b10111001

segment .text 
global main 					
main:
;-----------------------	
	mov al, [numero];al= 0xB9 = ;0b10111001
	and al, 0x38	;mascara  = ;0b00111000
	shr al, 3		;al= 0x07 = ;0b00000111

;---otra forma----------
	mov al, [numero];al= 0xB9 = ;0b10111001
	shr al, 3		;al= 0x17 = ;0b00010111
	and al, 0x07	;al= 0x07 = ;0b00000111

;---otra forma----------
	mov al, [numero];al= 0xB9 = ;0b10111001
	shl al, 2		;al= 0xE4 = ;0b11100100
	shr al, 5		;al= 0x07 = ;0b00000111
ret
	




