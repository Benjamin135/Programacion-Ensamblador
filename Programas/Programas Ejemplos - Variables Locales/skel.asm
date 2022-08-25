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

;file: %1.asm

;.text=   0X004016E0
;.data=   0x00403000

%macro  prologue 0
        push    rbp
        mov     rbp,rsp
        push    rbx
        push    r12
        push    r13
        push    r14
        push    r15
%endmacro

%macro  epilogue 0
        pop     r15
        pop     r14
        pop     r13
        pop     r12
        pop     rbx
        pop     rbp	;leave
%endmacro

extern printf, scanf		

segment .data

segment .rodata
		
segment .bss
;Block Started by Symbol(BSS) 

segment .text 

global main 					
main:
;---------------------------------------	

ret
;---------------------------------------
;..........subrutina....................	




