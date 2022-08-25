;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------


;file: denormal.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a	DD	-1.4e-45	;DENORMAL
b	DD	 1.6530e-39	;DENORMAL
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
	;etiqueta que indica el comienzo del programa principal
	;aqui van las instrucciones
;---------------------------------------	

ret
	




