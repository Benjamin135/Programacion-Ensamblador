;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: escalado.asm (nombre programa)
;registro
;nombres y apellidos
;Las instrucciones en ensamblador tienen el formato general siguiente:
;[etiqueta:] instrucci�n [destino[, fuente]] [;comentario]

;file: escalado.asm

segment .data
;aqui se declaran variables inicializadas
dato1     DB 0x11, 0x22, 0x33, 0x44, 0x55, 0x66
dato2     DB 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x00, 0x11, 0x22
		
segment .bss
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;----------------------------------	
;direccionamiento indice escalado
;base indexado
;------------------------------------
xor rdx, rdx
mov rax, dato1	;direccion 0x00402000
mov rbx, 1  	;indice
;[Registro Base + Registro Indice * escala]
;El registro base y el registro índice pueden ser cualquier registro de propósito
;general, el factor de escala puede ser 1, 2, 4 u 8
mov  dl, [rax + rbx*1]		;0x22
mov  dx, [rax + rbx*2]		;0x4433
mov edx, [rax + rbx*4]		;0x88776655
mov rdx, [rax + rbx*8]		;0x00ffeeddccbbaa99

;-------otra forma-------------------
xor rdx, rdx
mov rbx, 1	    ;indice
mov  dl, [dato1 + rbx*1]	;0x22
mov  dx, [dato1 + rbx*2]	;0x4433
mov edx, [dato1 + rbx*4]	;0x88776655
mov rdx, [dato1 + rbx*8]	;0x00ffeeddccbbaa99
;--------++++ desplazamiento---------
;[Registro Base + Registro Indice * escala + desplazamiento]
xor rdx, rdx
mov rax, dato1
mov rbx, 2
mov rdx, [rax+rbx*2+2]	;0xeeddccbbaa998877 

ret

	




