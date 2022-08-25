;----------------------------------------------------------------------------------------------------
; PRACTICA EXAMEN PRIMER PARCIAL
;----------------------------------------------------------------------------------------------------

segment .data

	a	dd	-35501	
	b	dd	220000999
	c	dd	-70503
	d	dd	8883127

segment .bss

	x	resd	1

segment .text
global main
main:

	; x = ((-b)*85)|((a>>5)-19)/((c-d)^(0xF3A5BE2F & d));

	xor rax, rax
	xor rbx, rbx
	
	mov eax, [a]
	mov ebx, [b]
	
	neg ebx				; (-b)
	imul ebx, 85		; ((-b)*85)
	
	sar eax, 5			; (a>>5)
	sub eax, 19			; ((a>>5)-19)
	
	;=======================================================
	
	xor rcx, rcx
	xor rdx, rdx
	
	mov ecx, [c]
	mov edx, [d]
	
	sub ecx, edx		; (c-d)
	and edx, 0xF3A5BE2F	; (0xF3A5BE2F & d)
	xor ecx, edx
	
	cmp ecx, 0
	je fin
	
	cdq
	idiv ecx
	or ebx, eax
	mov [x], ebx

	fin:

	ret


