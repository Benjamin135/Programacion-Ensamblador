;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------

;file: carter.asm

extern printf, scanf		

segment .data
a	DD	+23.85		;C/C++ -->> float (32-bits)
b	DD	-23.85		;C/C++ -->> float (32-bits)

c	DQ	+23.85		;C/C++ -->> double (64-bits)
d	DQ	-23.85		;C/C++ -->> double (64-bits)
		
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
;---------------------------------------
;..........funciones (subrutina)........	




