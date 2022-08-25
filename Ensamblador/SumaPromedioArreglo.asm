
segment .data

	arreglo dd  10, 20, 30, 40, 50, 60, 70, 80, 90, 100
	n 		dd  10

segment .bss

	suma  resd  1
	prom  resd  1

segment .text
global main
main:

	mov rcx, arreglo	; referencia
	mov edx, [n]		; valor
	mov r8, suma		; referencia
	mov r9, prom		; referencia
	
	call calcular

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

calcular:

	xor r10, r10		; indice
	xor rax, rax 		; acumulador suma
	
	loop1:
		add eax, [rcx+r10*4]	; suma += arreglo[i]
		inc r10
		cmp r10, rdx
		jl loop1
		mov [r8], eax		; almacenar "suma"
		
	; eax contiene el dividendo
	mov ebx, edx
	cdq
	idiv ebx
	mov[r9], eax		; almacenar "promedio"

ret















