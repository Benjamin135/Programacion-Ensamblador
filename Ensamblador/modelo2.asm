;----------------------------------------------------------------------------
; MODELO DE PRIMER PARCIAL - N°2
;----------------------------------------------------------------------------

segment .data

	a	dd	12, -25, 14, -84, 99
	k	dd	3

segment .bss

	b 	resd	5

segment .text
global main
main:

	xor rbx, rbx
	xor rax, rax
	xor rsi, rsi
	
	mov ebx, a
	mov rcx, 5
	
	ciclo:
	
		mov eax, [rbx + rsi]
		cdq
		idiv dword[k]
		mov [b + rsi], eax
		add rsi, 4
	
	loop ciclo

ret


