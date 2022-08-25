;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: sub.asm

extern printf, scanf		

segment .data 
a      DB	0x5A 	;0x5A	SS=  90   CS= +90   
b      DB	0xF9 	;0xF9	SS= 249   CS=  -7

;a-b = 0x5A - 0XF9 = 0x61
;SS 0x61=  97	;-->> C=1 OVERFLOW ->error -159
;CS 0x61= +97	;-->> O=0 OK!	
	
segment .bss
;aqui van las variables declaradas pero sin inicializar
c	resb	1

segment .text 
global main 					
main: 
	xor eax, eax
	mov ah, [a]			;ah= 0x5A
	mov cl, [b]			;cl= 0xF9
	sub ah, cl			;ah= ah-cl= 0x61 -->> banderas: C=1, Z=0, S=0, O=0
						;existe un "prestamo" (borrow)
	mov [c], ah 
    ret


;									  0	0
;    0x5A =    (  0x5A)	   (  0x5A)		0101_1010
; -) 0xF9 =  +)(- 0xF9)	+) (+ 0x07)		0000_0111
;	 ----       -------    ---------	---------
;	 0x61         0x61        0x61	  0	0110_0001

;CUIDADO:
;--------

;El carry producido por la suma es:  CF = 0
;Sin embargo el procesador muestra un CF = 1
;Tratandose de una resta la bandera de CARRY indica si hubo o no un préstamo (borrow).
;Por lo tanto hay que complementar el CARRY producido por la suma para que indique un préstamo.
;CF = 0  ->  (~0) = 1  por lo tanto  CF = 1.



