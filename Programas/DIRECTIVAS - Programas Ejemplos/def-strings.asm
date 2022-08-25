;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: def-strings.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
;------ASCII---------------------
caracter	DB 'z'									; 1 caracter
caraceres	DB 'A', 'Z', 'a', 'z'
cadena1  	DB 'INF221 Lenguaje Ensamblador', 0		; cadena de caracteres
cadena2  	DB "INF221 Lenguaje Ensamblador", 0
cadena3  	DB `INF221 Lenguaje Ensamblador`, 0		;comillas abiertas "backquotes" (` `)
cadena4  	DB "Hola Mundo", 0


;lo que muestra el debugger x64dbg a partir dela dirección de memoria 0x403010 :
;la codificación en ASCII (hexadecimal) de los caracteres definidos. 

;===================================================================================
;0000000000403010  7A 41 5A 61 7A 49 4E 46 32 32 31 20 4C 65 6E 67  zAZazINF221 Leng 
;0000000000403020  75 61 6A 65 20 45 6E 73 61 6D 62 6C 61 64 6F 72  uaje Ensamblador 
;0000000000403030  00 49 4E 46 32 32 31 20 4C 65 6E 67 75 61 6A 65  .INF221 Lenguaje 
;0000000000403040  20 45 6E 73 61 6D 62 6C 61 64 6F 72 00 49 4E 46   Ensamblador.INF 
;0000000000403050  32 32 31 20 4C 65 6E 67 75 61 6A 65 20 45 6E 73  221 Lenguaje Ens 
;0000000000403060  61 6D 62 6C 61 64 6F 72 00 48 6F 6C 61 20 4D 75  amblador.Hola Mu 
;0000000000403070  6E 64 6F 00 00 00 00 00 00 00 00 00 00 00 00 00  ndo............. 
;===================================================================================
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
	;etiqueta que indica el comienzo del programa principal
	;aqui van las instrucciones
;---------------------------------------	

ret




