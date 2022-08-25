;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: indirecto-reg.asm (nombre programa)
;registro
;nombres y apellidos

;file: indirecto-reg.asm
;---------------------------------------
;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

segment .data
;aqui se declaran variables inicializadas
dato1     DB 0x11, 0x22, 0x33, 0x44, 0x55
dato2     DB 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD
		
segment .bss
;aqui van las variables declaradas pero sin inicializar
dato3	resd	1

segment .text 
global main 					
main:
;----------------------------------------------	
;direccionamiento indirecto por registro (base)
;----------------------------------------------

	xor rax, rax
	mov rbx, dato2		; dirección rbx = 0000000000403015    
	mov  al, [rbx]		; al= 66 ==>> equivalente lenguaje "C/C++":  AL=*RBX
	;El operando [ecx] habrá de especificar un registro entre corchetes [ ]
	;el registro contendrá la "dirección" de memoria cuyo contenido queremos acceder.
	mov  ax, [rbx]		; ax= 7766     
	mov eax, [rbx]		; eax= 99887766  
	mov rax, [rbx]		; rax= DDCCBBAA99887766
    ;el segundo operando utiliza la dirección que tenemos en ecx
	;para acceder a memoria, se mueven 4 bytes a partir de
	;la dirección especificada por ecx y se guardan en eax.
	mov rbx, dato3
	mov [rbx], dword 27 ; mueve 27 = 0x1B a la posición de
						; memoria cuya dirección está en el registro rbx

;---------------------------------------------------------
;direccionamiento relativo por registro (index addressing)
;(llamado tambien modo base + desplazamiento) 
;---------------------------------------------------------
	xor rax, rax
	mov rdx, dato1		;dirección rdx= 0000000000403010   	 
	mov  al, [rdx+2]	;al= 33              
	mov  ax, [rdx+2] 	;ax= 4433 
	mov eax, [rdx+2]	;eax= 66554433
	mov rax, [rdx+2]
	ret
	




