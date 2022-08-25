;------------------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 7
;------------------------------------------------------------------------------------
; Calcular el promedio de los elementos que sean "positivos mayores de 5 y menores
; o iguales a 100 y que se encuentren en las posiciones de los indices impares"
; que existen en un arreglo 
;------------------------------------------------------------------------------------

segment .data

	arreglo  db  -10, 20, 45, -71, 4, 7, -105, 240, 30, 100
	num      db  10

segment .bss

	promedio  resb 1

segment .text
global main
main:

	mov rcx, arreglo
	mov dl, [num]
	call calPromedio
	mov [promedio], al

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

calPromedio:

	xor r10, r10  		; acumulador suma
	xor r11, r11		; indice
	
	mov al, dl
	cbw
	mov bl, 2
	idiv bl
	
	ciclo:
		cmp byte[rcx+1], 0
		jle contCiclo
		
		cmp byte[rcx+1], 5
		jle contCiclo
		
		cmp byte[rcx+1], 100
		jg contCiclo
		add r10b, byte[rcx+1]
	
		contCiclo:
		add rcx, 2
		inc r11
		cmp r11b, al
	
	jl ciclo
	
	mov al, r10b
	cbw
	idiv dl
	
ret




