;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;f(a)
;f(&a)
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

	mov eax, [dato1]	;1er. argumento al registro eax por "valor"
	CALL mascara
	mov [resultado1], eax
	nop

	;...............................
	;llama nuevamente a la subrutina
	mov eax, [dato2]	;1er. argumento al registro eax por "valor"
	CALL mascara
	mov [resultado2], eax
	nop         
	RET

;..........subrutina....................
;--------------------------------------------------;
;como "subrutina" acepta -> "PARAMETROS" de main ? ;
;--------------------------------------------------;

;int mascara(int a)         // function definition C/C++
	
;paso parametros por valor
;entrada registro:		eax
;resultado registro:	eax
mascara:
	and eax, 0XFFFF0000 ;resultado en EAX
	RET



