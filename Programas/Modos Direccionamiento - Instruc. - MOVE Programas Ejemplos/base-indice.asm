;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: base-indice.asm (nombre programa)
;registro
;nombres y apellidos

;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucción [destino[, fuente]] [;comentario]

;file: base-indice.asm

segment .data
;aqui se declaran variables inicializadas
dato1     DB 0x11, 0x22, 0x33, 0x44, 0x55, 0x66
dato2     DB 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD,0xEE, 0xFF
			
segment .bss
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:	
;--------------------------------------------------------
;direccionamiento "base mas indice" (base index addressing)
;--------------------------------------------------------
	xor eax, eax
	mov rbx, dato1	;dirección 0x0000000000403010
	mov rdx, 4  	                  
	mov  al, [rbx+rdx]		;0x55
;el registro ebx contiene la dirección de memoria como dirección "base" 
;que se suma al registro edx que actúa como "índice" respecto a esta dirección de memoria.
	mov  ax, [rbx+rdx]	 	;0x6655
	mov eax, [rbx+rdx]		;0x88776655  
	mov rax, [rbx+rdx]		;0xccbbaa9988776655  	

;---otra forma-------------------------------------------
	xor rax, rax
	mov rdx, 4  	                  
	mov  al, [dato1+rdx]	;0x55
;dato1 contiene la dirección base, edx actúa
;como registro índice
	mov  ax, [dato1+rdx] 	;0x6655
	mov eax, [dato1+rdx]	;0x88776655             
	mov rax, [dato1+rdx]	;0xccbbaa9988776655 
;-------------------------------------------------------
;direccionamiento "relativo base mas indice" 
;(llamado tambien: modo base + indice + desplazamiento) 
;-------------------------------------------------------
	xor rax, rax
	mov rbx, dato2			;dirección 0x0000000000403016      
	mov rsi, 0 
	mov  al, [rbx+rsi+2]	;0x99
	mov  ax, [rbx+rsi+2]	;0xaa99 
	mov eax, [rbx+rsi+2] 	;0xccbbaa99 
	mov rax, [rbx+rsi+2]	;0x00ffeeddccbbaa99 
ret


