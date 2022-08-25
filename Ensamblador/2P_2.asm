;--------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 2
;--------------------------------------------------------------------------

segment .data

	a	dd	258
	b 	dd	125
	c	dd	731

segment .bss

	x   resd  1

segment .text
global main
main:

	mov ecx, [a]
	mov edx, [b]
	mov r8d, [c]
	call calcular
	mov [x], eax

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

; x = ((-b)*80)|((a>>5)-20)/((c-b)^(b&0xABCDEF));

calcular:

	xor rax, rax
	xor rbx, rbx
	xor r10, r10
	
	mov ebx, edx		; ebx = b
	neg ebx				; (-b)
	mov r10d, 80		; r10d = 80
	imul ebx, r10d		; ((-b)*80)
	
	mov eax, ecx		; eax = a
	sar eax, 5			; (a>>5)
	sub eax, 20		; ((a>>5)-20)
	
	sub r8d, edx		; (c-b)
	and edx, 0xABCDEF	; (b&0xABCDEF)
	xor r8d, edx		; ((c-b)^(b&0xABCDEF))
	
	cdq
	idiv r8d			; ((a>>5)-20)/((c-b)^(b&0xABCDEF))
	
	or ebx, eax			; ((-b)*80)|((a>>5)-20)/((c-b)^(b&0xABCDEF))
	mov eax, ebx

ret

; x = ((-b)*80)|((a>>5)-20)/((c-b)^(b&0xABCDEF));






