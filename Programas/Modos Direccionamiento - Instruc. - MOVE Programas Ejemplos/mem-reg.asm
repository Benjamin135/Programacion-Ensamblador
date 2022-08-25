;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------
;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

;file: mem-reg.asm

segment .data
;aqui se declaran variables inicializadas
a	 dd 175
b	 dq 4097
c	 db 10, 20, 30, 40
d	 dd 0xffffffff
var1 db 0		   			;variable definida de 1 byte
var2 db 0x61	   			;variable definida de 1 byte
var3 dw 0x0200	   			;variable definida de 2 bytes
var4 dd 0x0001E26C 			;variable definida de 4 bytes	
var5 dq 0x0102030405060708	;variable definida de 4 bytes	


segment .bss
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:

;---------------------------------------------------

;instrucción "MOVE"   memónico -> MOV

;etiqueta:	instr. destino, fuente		;comentario
;				 destino <<-- fuente

;		1.)	MOV  	reg, inm
;		2.) MOV  	mem, inm
;		3.) MOV  	reg, reg
;		4.) MOV  	reg, mem
;		5.) MOV  	mem, reg

;---------------------------------------------------

;---direccionamiento directo------------------------
	mov ebx, [a]	;el operando habrá de especificar el nombre
					;de una variable de memoria entre corchetes [ ];
					;ebx=0x000000AF valor
	mov  al, [a]	;al=0xAF
	mov ecx, [b]	;ecx=0x00001001
	mov r12, [var5]	;r12=0x0102030405060708
	
	
	xor edx, edx
	mov dl, [c]		;dl=0x10
	mov dl, [c+1]	;dl=0x20
	mov dl, [c+2]	;dl=0x30
	
	mov edx, [c]	;edx=0x04030201
;-------------------------------------------------
	mov eax, a		;;se carga en el registro eax la "dirección" de la variable a
					;dirección!!!!! -->> 0x00402000
	mov esi, d		;;se carga en el registro esi la "dirección" de la variable d
					;dirección!!!!! -->> 0x00402014
;--- cuidado -----------------------------------------------------------------------
	mov eax, dword[var1];eax = 0x02006100
	;cuando accedemos a var1 como una variable de tipo DWORD el procesador
	;tomará como primer byte el valor de var1, pero también los 3 bytes que están
	;a continuación, por lo tanto, como los datos se tratan en formato little-endian,
	;consideraremos DWORD [var1] = 0x02006100 y este es el valor que llevaremos
	;a EAX (eax=0x02006100).
	ret





