;Microsoft x64 ABI (Application Binary Interface):
;rcx, rdx, r8, r9 	->   for integers 		   (left to right)-->> primeros 4 parametros enteros
;Remaining arguments are passed via the stack  (right to left)-->> [rsp+0x20],[rsp+0x28]......
;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:		-> 	 rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.					   	 
;VOLATILE(scratch): ->   rax, rcx, rdx, r8, r9, r10, r11
;Integers are returned in rax or rdx:rax.

; print-scan-string.asm

extern printf, scanf

section .data					
fmt		db		"%s", 0
	
section .bss
cadena	resb 50		;maximo 50 caracteres
	
section .text							
    global main					
main:		
;--- scanf("%s", &cadena); --------
sub rsp, 0x20

	mov rdx, cadena	; referencia
	mov rcx, fmt	; referencia
	call scanf

add rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
	ret
	