;--------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 1
;--------------------------------------------------------------------------

segment .data

	a 	dd	1
	b 	dd	2
	c 	dd	3

segment .bss

	x	resd  1

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

; x = ((-30)*(-a)-(b>>3))^(~c|(a&b)/((-b)%c));

calcular:

	xor rax, rax
	xor rbx, rbx
	xor r10, r10
	
	mov eax, ecx
	mov ebx, edx
	mov r10d, r8d
	
	neg eax			; (-a)
	mov r11d, -30
	imul eax, r11d	; (-30)*(-a)
	
	sar ebx, 3		; (b>>3)
	sub eax, ebx	; ((-30)*(-a)-(b>>3))
	mov r15d, eax
	
	not r10d		; ~c
	and ecx, edx	; (a&b)
	neg edx			; (-b)
	mov eax, edx
	cdq
	idiv r8d		; edx = (-b)%c)
	
	mov eax, ecx
	mov r11d, edx
	cdq
	idiv r11d
	or eax, r10d	; (~c|(a&b)/((-b)%c))
	xor eax, r15d	; ((-30)*(-a)-(b>>3))^(~c|(a&b)/((-b)%c))

ret


; x = ((-30)*(-a)-(b>>3))^(~c|(a&b)/((-b)%c));






