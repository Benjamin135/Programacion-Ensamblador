
segment .data

	arreglo1	dd		10, 15, 20, 25, 30, 0
	k	dd	  2

segment .bss

	arreglo2 resd	5

segment .text
global main
main:

	xor rax, rax
	xor rbx, rbx	; base
	xor rsi, rsi	; indice
	xor rcx, rcx
	
	mov rbx, arreglo1
	
	ciclo:
		mov ecx, [rbx + rsi]
		mov eax, ecx 
		cdq
		idiv dword[k]
		cmp edx, 0
		jz añadir
		add rsi, 4
		
	cmp eax, 0
	jnz ciclo
	jmp fin
		
	añadir:
		mov [arreglo2 + rsi], ecx
		add rsi, 4
		jmp ciclo
	
	fin:

	ret



