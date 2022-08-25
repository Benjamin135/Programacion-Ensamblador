;--------------------------------------------------------------------------
; PRACTICO PROGRAMACIÓN N° 4
;--------------------------------------------------------------------------
segment .data

	a	dq	10
	b	dq 	20
	
segment .bss

	c  resq	 1

segment .text
global main
main:

	mov rcx, [a]	; 1er argumento por valor --> rcx
	mov rdx, [b]	; 2do argumento por valor --> rdx
	call sumar
	mov [c], rax
	
ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

sumar:
	mov rax, rcx
	add rax, rdx
ret





