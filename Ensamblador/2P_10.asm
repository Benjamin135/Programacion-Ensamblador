;------------------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 10
;------------------------------------------------------------------------------------
; Calcular el promedio de los numeros enteros que sean "positivos, mayores de 10 
; y menores o iguales a 1000" en un arreglo 
;--------------------------------------------------------------------------
segment .data

	arreglo  dw  10, -25, 47, 1046, -176, 413, 89, -71, 12, -3
	num 	 dw  10

segment .bss

	promedio  resw  1

segment .text
global main
main:

	mov rcx, arreglo
	mov dx, [num]
	call calPromedio
	mov [promedio], ax

ret

; ----------------------------------------------------------------------------
; ........................Subrutinas........................
; ----------------------------------------------------------------------------

calPromedio:

	xor r10, r10		; indice
	xor r11, r11		; acumulador suma

	ciclo:
	
		cmp word[rcx+r10*2], 0
		jg esMayorA10
		jmp contCiclo
		
		esMayorA10:
			cmp word[rcx+r10*2], 10
			jg esMenorA1000
			jmp contCiclo
		
		esMenorA1000:
			cmp word[rcx+r10*2], 1000
			jg contCiclo
			add r11w, [rcx+r10*2]
	
		contCiclo:
		inc r10
		cmp r10w, dx
		
	jl ciclo

	mov ax, r11w
	mov r10w, dx
	cwd
	idiv r10w

ret




