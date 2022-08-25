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

;print-scan-int.asm

extern printf, scanf

section .data					
    msj1	db      "ingresar numero: ", 0
	msj2	db		"numero ingresado: %lld", 10, 0
	fmt		db		"%lld", 0		 ; 64 bits -> %lld (long long)	
	
section .bss
	numero	resq	1
	
section .text							
    global main					
main:	
;--- printf -------
sub rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
    mov rcx, msj1	; string to display in rcx
    call printf
	
;--- scanf --------
	mov rdx, numero	; referencia -> "C/C++" scanf("%lld",&numero)
	mov rcx, fmt	; referencia
	call scanf

;--- printf -------	
	mov rdx, [numero]; valor
	mov rcx, msj2	 ; string to display in rcx
    call printf
add rsp, 0x20		 ; 32 bytes (4 argumentos) -> shadow space
	ret