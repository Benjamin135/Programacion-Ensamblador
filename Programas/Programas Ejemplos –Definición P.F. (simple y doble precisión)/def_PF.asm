;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;------------------------------------------------------

;file: def_PF.asm

; -> .data  0x403010

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
;-------PF simple precision (32-bits)--------------
;		+30.25 = 0x41F20000
;		-30.25 = 0xC1F20000

flotante1	DD	+30.25		; simple precision -->> float (4-bytes=32-bits)
flotante2	DD	-30.25		; simple precision -->> float (4-bytes=32-bits)

flotante3	DD    0.0		; simple precision -->> float (4-bytes=32-bits)
flotante4	DD	 -3.025e+01	; simple precision -->> float (4-bytes=32-bits) en notación exponencial
flotante5	DD	  1.625e-3	; notación exponencial						; 
flotante6	DD	 +1.0	
flotante7	DD	 -1.0
flotante8	DD 1625.
flotante9  	DD	  1.625e3
flotante10	DD    3.14159


flotante20	DD	  5.0e+50	; + infinito !!
flotante21	DD	 -4.59e-41	; valor "subnormal" (denormal") [ minimo +/- 1.45e-45 MAXIMO +/- 1.175e-38]
flotante22	DD	 -5.0e+50	; - infinito !!

align 16
;-------PF doble precision (64-bits)----------------
;		+30.25 = 0x403E400000000000
;		-30.25 = 0xC03E400000000000

flotante30	DQ	+30.25		; doble precision -->> double (8-bytes=64-bits)
flotante31	DQ	-30.25		; doble precision -->> double (8-bytes=64-bits)

segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;------------
	nop
ret

