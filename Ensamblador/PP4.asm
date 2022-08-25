;-----------------------------------------------------------------------------
; MODELO EXAMEN PRIMER PARCIAL - N°4
;-----------------------------------------------------------------------------

segment .data

	a	dq	101, 220000999, -312, 8883127, 50, -95, 19, 4592
	b 	dq 	3093	
	c	dq	-7730

segment .bss

	promedio	resq	1

segment .text
global main
main:

	; a[i]*b + c
			
	xor rsi, rsi		; indice
	xor r10, r10		; acumulador
	
	mov rcx, 8
	mov rax, a
	
	ciclo:
		mov rbx, [b]
		imul rbx, [rax + rsi * 8]
		add rbx, [c]
		add r10, rbx
		inc rsi
		
	loop ciclo
	
	mov rax, r10
	cqo
	mov rcx, 8
	idiv rcx
	
	mov [promedio], rax

ret




