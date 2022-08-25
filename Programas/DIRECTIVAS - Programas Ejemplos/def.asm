;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: def.asm

;segment .data: dirección -> 0x403010

extern printf, scanf		

segment .data
;aqui se declaran variables "inicializadas

;directivas a usar:
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;& DB:-->> define una variable de tipo byte, 8 bits.								&
;& DW:-->> define una variable de tipo palabra (word), 2 bytes = 16 bits.			&
;& DD:-->> define una variable de tipo doble palabra (double word), 2 palabras =	&
;&	  	   4 bytes = 32 bits.														&
;& DQ:-->> define una variable de tipo cuádruple palabra (quad word), 4 palabras	&
;&	       = 8 bytes = 64 bits.														&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

align 16	  
;------un byte SS (sin signo)-----------
dato_byte0   	DB  71			;decimal
dato_byte1   	DB  0x87		;hexadecimal
dato_byte2		DB	0b10101010	;binario
cero			DB	0

;-------un byte CS (con signo)---------- 
dato_byte3   	DB -100
dato_byte4   	DB +56
dato_byte33		DB	0xFF
dato_byte44		DB	-1

;-------una palabra(word)SS---
dato_word5   	DW  4660
dato_word6   	DW 0x87AC
 
;-------una palabra(word)CS---
dato_word7  	DW  +19870    
dato_word8   	DW  -1

;-------una palabra doble(double word)SS---
dato_doble9  	DD  0x12345678    
dato_doble10   	DD  4_294_967_295	;se puede usar símbolo '_' para separar los dígitos de los valores numéricos

;-------una palabra doble(double word)CS---
dato_doble11  	DD  0x12345678    
dato_doble12   	DD  -1

;-------una palabra quadruple(quad word)SS---
dato_quad13		DQ	18446744073709551615


;-------una palabra quadruple(quad word)CS---
dato_quad14		DQ	+9223372036854775807	; 7FFFFFFFFFFFFFFF
dato_quad17		DQ	-9223372036854775808	; 8000000000000000
dato_quad15  	DQ  0x0123456789ABCDEF 
dato_quad16   	DQ  -1

;------múltiples valores (arreglos)--------
arreglo			DD 10, 20, 30, 40, 50

;-------valores repetidos--------
tabla   times 5 DB 15
cadena	times 10 DB "xyz"

;------ASCII---------------------
char		DB 'Z'			; 1 caracter
cadena1  	DB 'Core i7', 0	; cadena de caracteres
cadena2  	DB "Core i7", 0
cadena3  	DB `Core i7`, 0	;comillas abiertas "backquotes" (` `)

;===================================
;---------punto flotante------------
var2    DD	  3.25		;float  (32 bits)
var3	DQ 2345.7865	;double (64 bits)

;definición de constantes
;--------EQU------------------------
; definicion de constantes
TRUE	 EQU 1		;valor booleano
FALSE	 EQU 0

escala	 EQU 32		;definir una constante
cantidad EQU 10		;equivalente en "C" -> #define cantidad 10


;===============================================================	
segment .bss
;aqui van las variables declaradas pero sin inicializar

;directivas a usar:
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;& RESB: reserva espacio en unidades de byte						&
;& RESW: reserva espacio en unidades de palabra, 2 bytes			&
;& RESD: reserva espacio en unidades de doble palabra, 4 bytes		&
;& RESQ: reserva espacio en unidades de cuádruple palabra, 8 bytes	&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

total	 resb  10	;byte
x		 resw   2	;word
y		 resd   5	;double word
z		 resq 100	;quad word

segment .text 
global main 					
main:	;esta etiqueta indica el inicio del programa principal
		;aqui van las instrucciones
;---------------------------------------	
	nop
ret		;fin de programa
	




