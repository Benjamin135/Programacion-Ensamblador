;---------------------------------------------------------------------------------------------------
; De la resta de (a-b) donde estas variables son de 32 bits realizar la siguiente operacion 
; si el resultado es menor a 20
;	c = a + b;			y sino 
;	c = a - b;
; donde a = 200 y b = 215
;---------------------------------------------------------------------------------------------------

segment .data

	a	dd	200
	b	dd	215

segment .bss

	c	resd	1

segment .text 
global main
main:

	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	
	mov eax, [a]
	mov ebx, [b]
	sub eax, ebx
	
	cmp eax, 20
	jl  sumar
	jmp restar
	
	sumar:
		mov ecx, [a]
		add ecx, ebx
		mov [c], ecx
		
	jmp final
		
	restar:
		mov ecx, [a]
		sub ecx, ebx
		mov [c], ecx 
		
	final:
	
	ret 

