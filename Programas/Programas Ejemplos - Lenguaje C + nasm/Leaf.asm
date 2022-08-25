;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o Leaf.o Leaf.asm -l Leaf.lst
;link:	   -->> gcc64 -o Leaf Leaf.c Leaf.o
;run:      -->> Leaf
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

;file: Leaf.asm

;;## gcc -g leaf.o leaf.c -o leaf ##

; extern int leaf(int g, int h, int i, int j);  

; Description: This function demonstrates passing arguments between
; a C function and an assembly language function.
; Returns: (g + h) –(i+ j)

global leaf

;------------------------------------
;..........subrutina.................	

segment .text
leaf:
; cargar los valores de los argumentos
	mov eax, ecx  ; eax = 'g'
; calcular la suma (g + h)
	add eax, edx  ; eax = 'g' + 'h'
	
	mov ebx, r8d  ; ebx = 'i'
; calcular la suma (i + j)
	add ebx, r9d  ; ebx = 'i' + 'j'
	
	sub eax, ebx  ; (g + h) – (i + j)
	ret
	


