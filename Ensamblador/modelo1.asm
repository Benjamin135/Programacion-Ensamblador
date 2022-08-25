;------------------------------------------------------------------------------
; MODELO EXAMEN PRIMER PARCIAL - N°1
;------------------------------------------------------------------------------

segment .data

	a	dq	153, 220000999, -499, 8883127, 50, -95, 19, 4592, 0x123456789, -801, 0
	b 	dq	5093

segment .bss

	promedio 	resq	1
	residuo		resq	1

segment .text
global main
main:
	
	xor rax, rax
	xor rbx, rbx	
	xor rcx, rcx	;indice
	xor r9,  r9		;acumulador	
	
	ciclo:
		mov rbx, [b]
		imul rbx, [a + rcx * 8]
		add r9, rbx
		inc rcx
	
	cmp rax, [a + rcx * 8]
	jnz ciclo
	
	mov rax, r9
	cqo
	idiv rcx
	
	mov [promedio], rax
	mov [residuo], 	rdx

	ret


