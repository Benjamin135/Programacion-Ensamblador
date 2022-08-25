
segment .data

	a	dq	-35501
	b 	dq	220000999
	c	dq	-70503
	d	dq	8883127

segment .bss

	x 	resq	1

segment .text
global main
main:

	; x = ((-b)*85)|((a>>5)-19)/((c-d)^(0xF3A5BE2F & d));
	
	mov rax, [a]
	mov rbx, [b]
	
	neg rbx				; (-b)
	imul rbx, 85		; ((-b)*85)
	
	sar rax, 5			; (a>>5)
	sub rax, 19			; ((a>>5)-19)
	
	
	mov rcx, [c]
	mov rdx, [d]
	
	sub rcx, rdx		; (c-d)
	mov r8, 0xF3A5BE2F
	and rdx, r8	; (0xF3A5BE2F & d)
	xor rcx,rdx			; ((c-d)^(0xF3A5BE2F & d))
	
	cmp rcx, 0
	je fin
	
	cqo
	idiv rcx
	or rbx, rax
	mov [x], rbx
	
	fin:

	ret








