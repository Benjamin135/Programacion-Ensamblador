;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; Nombre y Apellido: Benjamin Condori Vasquez
; Resgistro: 220000999
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

segment .data
; Aqui se declaran las variables inicializadas

	a 	dd		8883127
	b	dd		-5000000
	c 	dd 		220000999
	d 	dd 		0xFEDCBA 	; 16702650 
	e	dd		150000000

segment .bss
; Aqui se declaran las variables sin inicializar

	x 	resd	1

segment .text
global main
main:
; Aqui van las instrucciones

	; x = (e << 4) - (d >> 3) ^ (~c | (a & b));
	
	xor rax, rax	; limpiando registros
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	xor rsi, rsi
	
	mov eax, [a]
	mov ebx, [b]
	mov ecx, [c]
	mov edx, [d]
	mov esi, [e]
	
	and eax, ebx	; (a & b)
	not ecx			; ~c
	or  ecx, eax	; (~c | (a & b)
	
	sal esi, 4		; (e << 4)
	sar edx, 3		; (d >> 3)
	sub esi, edx	; (e << 4) - (d >> 3)
	
	xor esi, ecx	; (e << 4) - (d >> 3) ^ (~c | (a & b))
	
	mov [x], esi

ret

