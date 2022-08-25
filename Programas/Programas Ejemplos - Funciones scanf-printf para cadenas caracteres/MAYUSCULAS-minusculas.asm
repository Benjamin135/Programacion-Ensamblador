;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI:
;rcx, rdx, r8, r9		 -->> for integers	   (left to right)-->> primeros 4 parametros enteros
;Remaining arguments are passed via the stack  (right to left)-->> [rsp+0x20],[rsp+0x28]......
;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:			 -->> 	 rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.
;VOLATILE(scratch): 	 -->>   rax, rcx, rdx, r8, r9, r10, r11
;Integers are returned in rax or rdx:rax.

;file: MAYUSCULAS-minusculas.asm

extern printf, scanf, strlen, gets		

segment .data
mensaje1	 db 10, "Introducir su nombre y apellido en MAYUSCULAS: ", 0
mensaje2	 db "Su nombre y apellido en minusculas es: %s", 10, 0
	
segment .bss
cadena resb 5			;reservar espacio para la cadena introducida
A	RESD 1
XXXXX XXXXX
segment .text 
global main 					
main:
sub rsp, 0x20
	mov rcx, mensaje1	;referencia  RCX <-- &mensaje1
	call printf

;----GETS-------	
	mov rcx, cadena		;referencia	 RCX <-- &cadena
	call gets			
	
;----strlen------
	mov rcx, cadena		;referencia	 RCX <-- &cadena
	call strlen			;longitud cadena

;----ciclo-------
	mov rbx, cadena
	mov ecx, eax
do:		mov al, [rbx]

		OR al, 0x20		;convertir MAYUSCULAS a minusculas
						;se respeta el espacio <sp>=0x20 | 0x20=0x20
		mov [rbx], al
		inc rbx
	loop do
	
;----imprimir-----	
	mov rdx, cadena		;referencia <-- &cadena 
	mov rcx, mensaje2	;referencia	
	call printf
add rsp, 0x20
ret
	




