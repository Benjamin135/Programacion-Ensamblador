;------------------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------

segment .data
; Aqui van las variables inicializadas

	a	dd		8883127
	b 	dd		-5000000
	c	dd		220000999
	d 	dd		0xFEDCBA 	; 16702650 
	e	dd		150000000

segment .bss
; Aqui van las varibales sin inicializar

	x	resd	1

segment .text
global main
main:
; Aqui van las instrucciones

	;	x = (a << 3) & (b - (~c));
	;	x = (x >> 2) | (d ^ e);
	;	x = ~x; 
	
	sal dword[a], 3		; (a << 3)
	not dword[c]		; (~c)
	
	xor rbx, rbx
	mov ebx, [b]		; ebx = b
	sub ebx, [c]		; (b - (~c))
	and ebx, [a]		; (a << 3) & (b - (~c))
	
	sar ebx, 2			; (x >> 2)
	
	xor rdx, rdx
	mov edx, [d]		; edx = d
	xor edx, [e]		; (d ^ e)
	or  ebx, edx		; (x >> 2) | (d ^ e)
	
	not ebx				; ~x
	mov [x], ebx		

	ret


