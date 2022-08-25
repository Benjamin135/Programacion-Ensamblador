;---------------------------------------------------------------------------

extern scanf, printf

segment .data
; aqui van las variables inicializadas

	t1	dd	220000999
	t2 	dd	-25
	t3	dd	8883127

segment .bss
; aqui van las variables sin inicializar

	t4	resd	1

segment .text

global main
main:
; aqui van las instrucciones

	; t4 = (-30 - t1) - (-t2) - t1++
	; t4 = (20 + t4) + (-t3 - 10)
	
	xor rdx, rdx
	
	mov edx, -30
	sub edx, [t1]
	neg dword[t2]
	sub edx, [t2]
	inc dword[t1]
	sub edx, [t1]
	
	add edx, 20
	neg dword[t3]
	sub dword[t3], 10
	add edx, [t3]
	mov [t4], edx

ret






