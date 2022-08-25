;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI (Application Binary Interface):
;rcx, rdx, r8, r9 	->   for integers 		   (left to right)-->> primeros 4 parametros enteros
;Remaining arguments are passed via the stack  (right to left)-->> [rsp+0x20],[rsp+0x28]......
;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:		-> 	 rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.					   	 
;VOLATILE(scratch): ->   rax, rcx, rdx, r8, r9, r10, r11
;Integers are returned in rax or rdx:rax.

extern printf, scanf		

;hello.asm

section .data					
    msj	db      "Hola Mundo", 10, 0		;10 -> <LF>, 0 -> <NULL>	
	
section .bss
							
section .text							
    global main					
main:
;-------prinf("Hola Mundo\n")-------

sub rsp, 0x20	; 32 bytes (4 argumentos) -> shadow space

	;-----------
	mov rcx, msj; cadena a desplegar en rcx por "referencia"
	call printf
	;-----------
	
add rsp, 0x20	; 32 bytes (4 argumentos) -> shadow space
		ret
		
;-----------------------------------



