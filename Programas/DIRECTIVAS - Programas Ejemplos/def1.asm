;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------

;file: def1.asm

extern printf, scanf		

segment .data
;directivas a usar:
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;& DB:-->> define una variable de tipo byte, 8 bits.								&
;& DW:-->> define una variable de tipo palabra (word), 2 bytes = 16 bits.			&
;& DD:-->> define una variable de tipo doble palabra (double word), 2 palabras =	&
;&	  	   4 bytes = 32 bits.														&
;& DQ:-->> define una variable de tipo cuadruple palabra (quad word), 4 palabras	&
;&	       = 8 bytes = 64 bits.														&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

;direccion de memoria para ver los datos -->> .data 0x403010 
bVar	 db 10			  		; byte variable
cVar	 db 'X'			  		; single character 0x58
str1	 db "Hola Mundo!", 0 	; string
wVar	 dw 5000		  		; word 16-bit variable
dVar	 dd 50000		  		; 32-bit variable
arr		 dd 100, 200, 300 		; 3 element array
qVar	 dq 1000000000	  		; 64-bit variable
flt1	 dd 3.14159		  		; 32-bit float

segment .bss
;directivas a usar:
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;& RESB: reserva espacio en unidades de byte						&
;& RESW: reserva espacio en unidades de palabra, 2 bytes			&
;& RESD: reserva espacio en unidades de doble palabra, 4 bytes		&
;& RESQ: reserva espacio en unidades de cuádruple palabra, 8 bytes	&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

bArr	 resb   10		 ; 10 element byte array
wArr	 resw   50		 ; 50 element word array
dArr	 resd  100		 ; 100 element double array
qArr	 resq  200		 ; 200 element quad array

segment .text 

global main 					
main:
;----------
	nop
ret
	




