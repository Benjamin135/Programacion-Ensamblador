;------------------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 9
;------------------------------------------------------------------------------------

segment .data

	a	dd	9085
	b 	dd	18
	c	dd 	25

segment .bss

	d 	resd  1

segment .text
global main
main:

	mov ecx, [a]
	mov edx, [b]
	mov r8d, [c]
	call calcular
	mov [d], eax

ret

; ------------------------------------------------------------------------
; ..........................Subrutinas..........................
; ------------------------------------------------------------------------

; d = ((a<<3)&(-b*8))/((b-c)^3)

calcular:

	xor rax, rax
	xor rbx, rbx
	
	mov eax, ecx
	mov ebx, edx
	
	sal eax, 3		; (a<<3)
	
	neg ebx			; -b
	mov r10d, 8
	imul ebx, r10d	; (-b*8)
	
	and eax, ebx	; ((a<<3)&(-b*8))
	
	sub edx, r8d	; (b-c)
	mov r10d, edx
	imul edx, edx
	imul edx, r10d	; ((b-c)^3)
	
	mov r10d, edx
	cdq
	idiv r10d		; ((a<<3)&(-b*8))/((b-c)^3)

ret



