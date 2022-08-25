;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)
;registro:
;nombres y apellidos:

extern printf, scanf		

segment .data
arreglo		db	10, 20, 30, 40, 50

		
segment .bss



segment .text 

global main 					
main:	
;acceder a los elementos del arreglo - > "arreglo"
	mov al, [arreglo]
	mov al, [arreglo+1]
	mov al, [arreglo+2]
	mov al, [arreglo+3]
	mov al, [arreglo+4]	
ret





