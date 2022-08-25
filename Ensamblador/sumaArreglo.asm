;--------------------------------------------------------------------------
; PRACTICO PROGRAMACIÓN N° 4
;--------------------------------------------------------------------------
segment .data

	arreglo	  dd	10, 20, 30, 40, 50, 60, 70, 80, 90, 100
	n		  dd 	10
	
segment .bss

	suma  resd	 1

segment .text
global main
main:

	mov rcx, arreglo	; paso de parametro por referencia
	mov edx, [n]		; paso de parametro por valor
	call sumar
	mov [suma], eax
	
ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

sumar:
	xor r10, r10		; indice
	xor rax, rax		; acumulador suma

Loop1:
	add eax, dword[rcx+r10*4]	; suma += arreglo[i]
	inc r10
	cmp r10, rdx		
	jl Loop1
	
ret








