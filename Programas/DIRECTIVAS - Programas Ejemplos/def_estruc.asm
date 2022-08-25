;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------

;file: def_estruc.asm

extern _printf, _scanf

;definición de constantes (igual)
;--------directiva EQU---------------------
escala		 EQU 32
cantidad	 EQU 0x10	
mensaje		 EQU "Hola"	

segment .data
;aqui se definen variables inicializadas
;db: define una variable de tipo byte, 8 bits.
;dw: define una variable de tipo palabra (word), 2 bytes = 16 bits.
;dd: define una variable de tipo doble palabra (double word), 2 palabras =4 bytes = 32 bits.
;dq: define una variable de tipo cuádruple palabra (quad word), 4 palabras = 8 bytes = 64 bits.

var1	 db 255					 ; define una variable con el valor 0xFF
var01	 db -128				 ; entero con signo a nivel de byte
Var2	 dw 65535				 ; en hexadecimal 0xFFFF
var02	 dw -1					 ; entero con signo a nivel de word
var3	 dd 4294967295			 ; en hexadecimal 0xFFFFFFFF
var4	 dq 18446744073709551615 ; en hexadecimal 0xFFFFFFFFFFFFFFFF

;separar los dígitos de los valores numéricos iniciales para facilitarla lectura.

var5	  dd 4_294_967_295
var6	  dq 0xFF_FF_FF_FF_FF_FF_FF_FF

;valores decimales------------------------
var7	  db   67	  ;el valor 67 decimal
var8	  db 0d67     ;el mismo valor
var88	  db  67d	  ;el mismo valor

;valores hexadecimales--------------------
var9	  db 0xFF
var10	  dw 0hA3
var11	  dw 33FFh

;valoress binarios------------------------
var12	  db 0b01000011
var13	  dw 0b0110_1100_0100_0011
var14	  db 01000011b
var15	  dw 0110_0100_0011b

;Los caracteres y las cadenas de caracteres han de escribirse entre comillas
;simples (''), dobles ("") o comillas abiertas (backquotes) (` `):

var16	  db 'A'
var17	  db "A"
var18	  db `A`

;Las cadenas de caracteres (strings) se definen de la misma manera:
cadena    db 'Hola' ;define una cadena formada por 4 caracteres
cadena1   db "Hola"
cadena2   db `Hola`

cadena3	  db 'Hola'
cadena4   db 'H','o','l','a'
cadena5   db 'Hol','a'

;vectores-------------------------
vector40	 db 23, 42, -1, 65, 14		 ;vector formado por 5 valores de tipo byte
vector41	 db 'a', 'b', 'c', 'd'		 ;vector formado por 4 bytes,
										 ;inicializado usando caracteres
vector42	 db 0x61, 0x62, 0x63, 0x64   ;97, 98, 99, 100	;es equivalente al vector anterior
vector43	 dw 1000, 2000, -1000, 3000  ;vector formado por 4 palabras

;inicializar vectores con el mismo valor-------------------------------------
;directiva "times"-----------------------------------------------------------
vector44	 times 5 dw 0	;vector formado por 5 palabras todas inicializadas en 0

;---------punto flotante--------------------
var22	  DD	  3.25	;float
var33	  DD	3.25e+5	;notación exponencial
var44     DQ 2345.7865	;double

;===========================================
segment .bss
;Sección .bss, variables no inicializadas
;aqui van las variables declaradas pero sin inicializar

;resb:	 reserva espacio en unidades de byte
;resw:	 reserva espacio en unidades de palabra, 2 bytes
;resd:	 reserva espacio en unidades de doble palabra, 4 bytes
;resq:	 reserva espacio en unidades de cuádruple palabra, 8 bytes

var50 resb 1 ;reserva 1 byte
var51 resb 4 ;reserva 4 bytes
var52 resw 2 ;reserva 2 palabras = 4 bytes, equivalente al caso anterior
var53 resd 1 ;reserva una cuádruple palabra = 4 bytes
;equivalente a los dos casos anteriores

segment .text 
global _main 					
_main:	;esta etiqueta indica el inicio del programa principal
		;aqui van las instrucciones
;-------------------------------------------------------------	
	nop
ret	;fin de programa
	




