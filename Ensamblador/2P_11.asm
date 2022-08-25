;------------------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 10
;------------------------------------------------------------------------------------
; Calcular el promedio de los numeros "positivos pares, mayores de 20 
; y menores o iguales a 2000" en un arreglo 
;------------------------------------------------------------------------------------

segment .data

	arreglo	  dd   48, 412, 152, 1646, -46, 17627, 2001, 162, 646, 16
	num 	  db   10

segment .bss

	promedio   resd   1

segment .text
global main
main:

	mov rcx, arreglo
	mov dl, [num]
	call calPromedio
	mov [promedio], eax

ret

; ----------------------------------------------------------------------------
; ........................Subrutinas........................
; ----------------------------------------------------------------------------

calPromedio:

	xor r10, r10		; indice
	xor r11, r11		; acumulador suma
	xor r12, r12 		; contador
	xor rbx, rbx
	
	mov bl, dl

	Ciclo:
	
		cmp dword[rcx+r10], 0
		jle contCiclo
		
		cmp dword[rcx+r10], 20
		jle contCiclo
		
		cmp dword[rcx+r10], 2000
		jg contCiclo
		
		mov eax, dword[rcx+r10]
		cdq
		mov r13d, 2
		idiv r13d
		
		cmp edx, 0
		jne contCiclo
		
		add r11d, dword[rcx+r10]
		
		contCiclo:
		add r10, 4
		inc r12
		cmp r12b, cl
		
	jl Ciclo
	
	mov eax, r11d
	cdq
	idiv ebx

ret 







