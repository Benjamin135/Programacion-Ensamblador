

segment .data

	n	dq	5

segment .bss

	prom_cubos  resq	1
	
segment .text
global main
main:

	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor r10, r10
	
	
	mov rcx, [n]
	
	ciclo:
		mov rbx, rcx
		imul rbx, rcx			
		imul rbx, rcx		
		add r10, rbx
		
	loop ciclo
		
	mov rax, r10
	cqo
	idiv qword[n]
	
	mov [prom_cubos], rax

ret 


