
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win64 -o P1.obj P1.asm -l P1.lst
;gcc64 -o P1 P1.obj
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: IDIV-64.asm

segment .data
a	DD	214_748_364		  ;0xCCC_CCCC
b	DW	     30_000		  ;0x7530

c	DQ  2_000_000_000_000 ;0x1D1A94A2000
d	DD	          300_000 ;0x493E0
		
segment .text 
global main					
main:
;-------------------
;---division 32 bits
	mov ax, [a]
	mov dx, [a+2]
	mov bx, [b]
	idiv bx
	
;---division 64 bits	
	mov eax, [c]
	mov edx, [c+4]
	mov ebx, [d]
	idiv ebx
ret



