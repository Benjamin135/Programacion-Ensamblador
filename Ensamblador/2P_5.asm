;--------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 5
;--------------------------------------------------------------------------
; Calcular el promedio de los numeros posivos o negativos "impares"
; que existen en un arreglo 
;--------------------------------------------------------------------------

segment .data

	arreglo  dd  45, -4153, 151, 16463, -46, -17627, 220014, 165, 646, -15
	num 	 db	 10

segment .bss

	promedio  resd  1

segment .text
global main
main:

	mov rcx, arreglo
	mov dl, [num]
	call promediar
	mov [promedio], eax

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

promediar:
	
	xor r10, r10		; indice
	xor r11, r11		; acumulador suma
	xor r13, r13		; contador
	xor rbx, rbx
	
	mov bl, dl			; bl = dl = 10
	
	ciclo:
		mov eax, [rcx+r10]
		cdq
		mov r12d, 2
		idiv r12d
		cmp edx, 0
		je contCiclo
		
		add r11d, [rcx+r10]
		
		contCiclo:
		add r10, 4
		inc r13
		cmp r13b, bl
	
	jl ciclo
	
	mov eax, r11d
	cdq
	idiv ebx
	
ret





