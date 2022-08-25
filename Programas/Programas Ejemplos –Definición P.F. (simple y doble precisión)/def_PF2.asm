;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------

;file: Planck.asm

extern printf, scanf		

;Very large numbers (sec/millennium)
; 31,556,926,00010 -> (3.155692610 x 10^10)
;Very small numbers? (Bohr radius)
; 0.000000000052917710m ->  (5.2917710 x 10^-11)

segment .data
;aqui se declaran variables inicializadas
milenio dd	3.155692610e+10 ;segundos en un milenio
bohr	dd	5.2917710e-11	;radio de Bohr
planck	dd	6.626e-34		;constante de Planck
		
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





