;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ASCII.asm (nombre programa)
;registro:....
;nombres y apellidos:....

extern printf, scanf		

segment .data
;aqui se declaran variables "inicializadas"

;directivas a usar:
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;& DB:-->> define una variable de tipo byte 8 bits.(para definir cadenas caracteres)&								&
;& DW:-->> define una variable de tipo palabra (word), 2 bytes = 16 bits.			&
;& DD:-->> define una variable de tipo doble palabra (double word), 2 palabras =	&
;&	  	   4 bytes = 32 bits.														&
;& DQ:-->> define una variable de tipo cuadruple palabra (quad word), 4 palabras	&
;&	       = 8 bytes = 64 bits.														&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

ascii	db "INF221 Programacion Ensamblador", 0


;segment .data	direccion memoria -->> 0x403010
;ver en memoria codificación(HEX)cadena de caracteres ASCII -> INF221 Programación Ensamblador 
;0000000000403010:  49 4E 46 32 32 31 20 50 72 6F 67 72 61 6D 61 63 INF221 Programac 
;0000000000403020:  69 6F 6E 20 45 6E 73 61 6D 62 6C 61 64 6F 72 00 ión Ensamblador. 

segment .text
global main
main:
	nop
ret		;fin de programa
	




