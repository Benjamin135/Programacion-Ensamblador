;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)
;registro
;nombres y apellidos
;The only registers that the called function is required to preserve (the calle-save registers) are:
;rbp, rbx, r12, r13, r14, r15. All others are free to be changed by the called function.
;Integers are returned in rax or rdx:rax, and floating point values are returned in xmm0 or xmm1:xmm0.
;rcx, rdx, r8, r9 -->> primeros 4 parametros enteros windows

;file: RESUMEN_modos.asm

extern printf, scanf		

segment .data
Val		dq 10
MyArray	dq 10, 20, 30, 40, 50, 60, 70, 80
	
segment .bss

segment .text 

global main 					
main:
;==========================================================
;EffectiveAddress = [BaseReg + IndexReg*ScaleFactor + Disp]
;==========================================================
;instrucción mov
;ejemplos diferentes "modos de direccionamiento"  
;-----------------------------------------------

;segment .data -> 0x403010
	
;RIP + Disp:
;-----------
		mov rax, [Val]		;rax=0xA
		
;BaseReg:
;--------
nop	
		mov rbx, Val		;direccion -> rbx=0x403010
		mov rax, [rbx]		;rax=0xA	
		
;BaseReg + Disp:
;---------------
nop
		mov rbx, MyArray	;dirección -> rbx=0x403018
		mov rax, [rbx+16]	;rax=0x1E
		
;IndexReg * SF + Disp:
;---------------------
nop 
		xor r15, r15				;indice=0
		mov rax, [MyArray+r15*8+32]	;rax=0x32
		
;BaseReg + IndexReg:
;-------------------
nop
		xor r15, r15			;indice
		mov rbx, MyArray		;dirección -> rbx=0x403018
		mov rax, [MyArray+r15]	;rax=0x0A
		
;BaseReg + IndexReg + Disp:
;--------------------------
nop 
		xor r15, r15			;indice
		mov rbx, MyArray		;dirección -> rbx=0x403018
		mov rax, [rbx+r15+24]	;rax=0x28
		
;BaseReg + IndexReg * SF:
;------------------------
nop 
		xor r15, r15			;indice
		mov rbx, MyArray		;dirección -> rbx=0x403018		
		mov rax, [rbx+r15*8]	;rax=0xA
		
;BaseReg + IndexReg * SF + Disp:
;-------------------------------
nop
		xor r15, r15			;indice
		mov rbx, MyArray		;dirección -> rbx=0x403018
		mov rax, [rbx+r15*8+56]	;rax=0x50
ret
	




