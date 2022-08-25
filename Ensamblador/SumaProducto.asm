
segment .data

	a  dd   75
	b  dd   125

segment .bss

	suma  resd  1
	prod  resd  1

segment .text
global main
main:

	mov ecx, [a]		; 1er argumento por "valor"
	mov edx, [b]		; 2do argumento por "valor"
	mov r8, suma		; >>>>> "referencia" (64-bits)
	mov r9, prod		; >>>>> "referencia" (64-bits)
	
	call calcular

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

calcular:

	mov eax, ecx		; eax = a
	add eax, edx		; eax = a + b
	mov [r8], eax		; almacena resultado en "suma"

	imul ecx, edx		; ecx = a * b
	mov [r9], ecx		; almacena resultado en "prod"

ret















