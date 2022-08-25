;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: reg-mem.asm (nombre programa)
;registro
;nombres y apellidos

;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

;file: reg-mem.asm

segment .data
;aqui se declaran variables inicializadas
x	DB	45
y	DW	12345
		
segment .bss
;aqui van las variables declaradas pero sin inicializar
a	resd 1
b	resd 1
c	resw 1
d	resb 1
e	resq 1

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

;carga previa valores de los registros 
	mov eax, 0x12345678
	mov ebx, -12345678
	mov cx,  0xabcd
	mov dl,  255
	mov r10, 18446744073709551615
	
;-----------------------------------------
;---direccionamiento directo--------------	
	mov [a], eax ; move a double word to "a"
	mov [b], ebx ; move a double word to "b"
	mov [c], cx  ; move a word to "c"
	mov [d], dl  ; move a byte to "d"
	mov [d], ch
	mov [e], r10 ; move a quad word to "e"
	
	mov [x], al	 ; move a byte to "x"
	mov [y], ax	 ; move a word to "y" 
	ret




