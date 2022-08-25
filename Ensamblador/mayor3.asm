;--------------------------------------------------------------------------
; PRACTICO PROGRAMACIÓN N° 4
;--------------------------------------------------------------------------
segment .data

	a	dd	10
	b	dd 	-30
	c 	dd	20
	
segment .bss

	x  resd	 1

segment .text
global main
main:

	xor rcx, rcx
	xor rdx, rdx
	xor r8, r8

	mov ecx, [a]	; 1er argumento por valor --> rcx
	mov edx, [b]	; 2do argumento por valor --> rdx
	mov r8d, [c]	; 3er argumento por valor --> r8
	call mayor
	mov [x], eax
	
ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

mayor:
	cmp ecx, edx	; compara a y b
	jge L1			; jump si a >= b		
	mov ecx, edx	; ecx = b
	
L1: cmp ecx, r8d	; compara a y c
	jge L2			; jump si a >= c
	mov ecx, r8d	; ecx = c
	
L2:	mov eax, ecx
	ret










