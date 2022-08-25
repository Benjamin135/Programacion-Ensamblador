;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: call-primero.asm

segment .data
;aqui se declaran variables inicializadas
dato1	DD	0x12345678
dato2	DD	0x87654321
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar
resultado1 resd 1
resultado2 resd 1

segment .text 
global main 					
main:
;--------------------------------------------------;
;como "main" pasa -> "ARGUMENTOS" a la subrutina ? ;
;--------------------------------------------------;
;---------------------------------------
	mov rax, dato1			;1er. argumento al registro rax por "referencia (direccion)"
	call mascara			;llamada subrutina "mascara"
	mov [resultado1], eax
	nop

	;...............................
	;llama nuevamente a la subrutina
	mov rax, dato2			;1er. argumento al registro rax por "referencia (direccion)"
	call mascara			;llamada subrutina "mascara"
	mov [resultado2], eax
	nop         
ret
;---------------------------------------
;..........subrutina....................
;--------------------------------------------------;
;como "subrutina" acepta -> "PARAMETROS" de main ? ;
;--------------------------------------------------;

;int mascara(int *a)         // function definition C/C++
	
;paso parametros por referencia
;parametro registro:    rax
;resultado registro:	rax
mascara:
	mov eax, [rax]
	and eax, 0xFFFF0000 ;resultado en EAX
	RET



