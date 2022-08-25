;--------------------------------------------------------------------------
; PRACTICO PROGRAMACIÓN N° 4
;--------------------------------------------------------------------------
segment .data

	a	dq	5
	b	dq 	10
	
segment .bss

	x  resq	 1
	y  resq	 1

segment .text
global main
main:

	mov rcx, [a]	; paso de parametro por valor
	call square
	mov [x], rax
	
	mov rcx, b		; paso de parametro por referencia
	call square2
	mov [y], rax
	
ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

square:				; subrutina paso de parametro por valor
	mov rax, rcx
	imul rax, rcx
ret

square2:			; subrutina paso de parametro por referencia
	mov rax, [rcx]
	imul rax, rax
ret






