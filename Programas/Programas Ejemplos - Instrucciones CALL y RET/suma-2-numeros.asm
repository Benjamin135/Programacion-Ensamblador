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

;file: sumar-2-numeros.asm

;.text=   0X00401550
;.data=   0x00403010

global main 
		
segment .data
a	dq	 10
b	dq	 20


segment .bss
c	resq 1

segment .text 				
main:
		nop
;------ paso parametros ---- 
		mov rcx, [a]	;1er. argumento por valor -> rcx
		mov rdx, [b]	;2do. argumento por valor -> rdx
	
		CALL sumar		;llamada subrutina "sumar"
		
		mov [c], rax 
		ret
 
;........ subrutina .......
;-----------------------------------------------
;         AddSub.asm
;-----------------------------------------------

;int AddSub(int a, int b)
;calcular: a + b
sumar:
		nop
        mov rax, rcx	;rax = a
        add rax, rdx	;rax = a + b
        RET				;return result to caller

