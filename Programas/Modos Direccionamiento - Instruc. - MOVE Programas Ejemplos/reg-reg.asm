;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: reg-reg.asm (nombre programa)
;registro
;nombres y apellidos

;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

;file: reg-reg.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
		
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

;-------------------------------------------------------------
	mov rax, 0x0123456789abcdef	;carga previa del registro rax
;-------------------------------------------------------------

;---direccionamiento de registro------------------------------
	
	mov bl, ah		;copia el contenido de ah a bl (1 byte)						C/C++ bl=ah
	mov cx, ax		;copia el contenido de ax a cx (2 bytes=1 word)				C/C++ cx=ax
	mov ebx, eax	;copia el contenido de eax a ebx (1 double word = 4 bytes)	C/C++ ebx=eax
	mov esi, eax	;copia el contenido de eax a esi (1 double word = 4 bytes)	C/C++ esi=eax
	mov r15, rax	;copia el contenido de rax a r15 (1 qouble word = 8 bytes)	C/C++ r15=rax
	ret
	




