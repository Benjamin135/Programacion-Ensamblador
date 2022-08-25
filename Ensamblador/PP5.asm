
segment .data

	arreglo    db	1, 2, 3, 5, 0

segment .bss

	paridad    resb	 1

segment .text
global main
main:

	xor rbx, rbx		; base
	xor rsi, rsi 		; indice
	xor rax, rax		; acumulador
	xor rdx, rdx
	
	mov rbx, arreglo
	
	ciclo: 
		mov dl, [rbx, rsi]
		mov rcx, 8	
		
		subCiclo: 
			mov r12b, dl
			and r12b, 1
			add al, r12b
			ror dl, 1
			
		loop subCiclo
		inc rsi
		
	cmp dl, 0
	jnz ciclo
	
	shr al, 1
	jc esImpar
	jmp esPar
	
	esImpar:
	mov byte[paridad], 0
	jmp fin
	
	esPar:
	mov byte[paridad], 1
	
	fin:

ret



