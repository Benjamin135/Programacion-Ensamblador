;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)
;registro
;nombres y apellidos

;file: inm-mem.asm
;---------------------------------------
;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

segment .data
;aqui se declaran variables inicializadas
		
segment .bss
;aqui van las variables declaradas pero sin inicializar
a	resb 1
b	resw 1
c	resd 1
d	resq 1

segment .text 
global main 					
main:
;--------------------------------------------------

;instrucción "MOVE"   memónico -> MOV

;etiqueta:	instr. destino, fuente		;comentario
;				 destino <<-- fuente

;		1.)	 MOV  	reg, inm
;		2.)  MOV  	mem, inm
;		3.)  MOV  	reg, reg
;		4.)  MOV  	reg, mem
;		5.)  MOV  	mem, reg
;----------------------------------------------------
	
	mov byte[a], 12			 			;mueve 12 a la posición de memoria (variable) etiquetada
										;"a", esta variable debe estar previamente definida
	mov word[b], 0x1234	
	mov	dword[c], -2147483648			;menor numero negativo C2 en 32 bits..
	mov qword[d], 18446744073709551615	;mayor entero SS en 64 bits
	
	
	;---------------------------------
	mov byte[0x00407030], 12			;mueve 12 a la posición de memoria 0x00407030
	mov dword[0x00407030], 0x12345678 
	ret





