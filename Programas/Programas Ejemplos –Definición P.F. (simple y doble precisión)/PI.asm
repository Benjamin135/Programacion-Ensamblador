;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------

;file: PI.asm

extern printf, scanf		

segment .data
PI_simple	DD	 3.14159265358979323846		;C/C++ -->> float (32-bits)simple precisión
											;0x40490FDB
align 16
PI_doble	DQ	 3.14159265358979323846		;C/C++ -->> double (64-bits)doble precisión
											;0x400921FB54442D18
		
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




