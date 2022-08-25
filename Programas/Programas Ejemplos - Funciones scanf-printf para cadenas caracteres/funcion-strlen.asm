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

;file: length.asm

;.text=   0X00401550
;.data=   0x00403010

extern printf, scanf, strlen		

segment .data
msj1	db      "ingresar cadena: ", 0
msj2	db		"longitud cadena ingresada: %d", 10, 0
fmt		db		"%s", 0
	
segment .bss
;Block Started by Symbol(BSS) 
cadena	resb 50	 ;maximo espacio reservado para la cadena introducida

segment .text 
global main 					
main:
;---------------------------------------	   
sub rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
;--- printf("ingresar cadena: "); -------
	mov rcx, msj1	; string to display in rcx
    call printf
	
;--- scanf("%s", &cadena); --------
	mov rdx, cadena	; referencia
	mov rcx, fmt	; referencia
	call scanf

;--- strlen(cadena) -------
	mov rcx, cadena	;REFERENCIA
	call strlen
	
;--- printf -------	
	mov rdx, rax	; valor
	mov rcx, msj2	; string to display in rcx
    call printf
add rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
	ret





