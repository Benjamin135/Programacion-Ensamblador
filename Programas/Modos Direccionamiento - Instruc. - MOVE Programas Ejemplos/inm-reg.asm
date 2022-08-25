;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: inm-reg.asm
;---------------------------------------
;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

;file: inm-reg.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
		
segment .bss
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;--------------------------------------------------

;instrucción "MOVE"   memónico -> MOV

;etiqueta:	instr. destino, fuente		;comentario
;				 destino <<-- fuente

;		1.)	MOV  	reg, inm
;		2.) MOV  	mem, inm
;		3.) MOV  	reg, reg
;		4.) MOV  	reg, mem
;		5.) MOV  	mem, reg

;---------------------------------------------------

;-------direccionamiento inmediato-------------------------------------------
			
		mov ah,  45	 	 ;# mueve 45 al registro de 8 bits ah. C/C++ -> ah=45;
						 ;# el segundo operando 45 utiliza "direccionamiento inmediato".
E1:		mov ax,  -123	 ;# mueve el valor inmediato -123 al registro ax
		mov eax, 85	 	 ;# mueve el valor inmediato 85 al registro eax
		mov ebx, -50678	 ;# mueve el valor inmediato -5678 al registro ebx
		mov ecx, 0x100 	 ;# mueve el valor inmediato 0x100 hexadecimal al registro ecx
		mov rax, -9223372036854775808  ;# menor numero negativo CS
		mov r8,  18446744073709551615  ;# mayor numero SS
		
cinco	equ 0x5			 ;se define una constante en hexadecimal
		mov al, cinco	 ;se utiliza el valor de la constante como
						 ;valor inmediato
						 
		mov al, 'A'		 ; al= 0x41
		mov ax, "AB"	 ; valor inmediato expresado como una cadena
						 ; de caracteres ax= 0x4241
		ret





