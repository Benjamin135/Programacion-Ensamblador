;------------------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 8
;------------------------------------------------------------------------------------
; Escribir un programa para eliminar un determinado elemento de un arreglo inicial
;------------------------------------------------------------------------------------

segment .data

	arreglo1	dd   1, 2, 3, 4, 3, 6, 7, 8, 3, 10, 0
	elemento 	dd	 3

segment .bss

	arreglo2   resd  10

segment .text
global main
main:

	mov rcx, arreglo1
	mov rdx, arreglo2
	mov r8d, [elemento]
	call eliminar

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

eliminar:

	xor rbx, rbx

	cmp dword[rcx], r8d
	je disminuir
	mov ebx, dword[rcx]
	mov [rdx], ebx
	jmp ciclo
	
	disminuir: 
		sub rdx, 4
		
	ciclo:
		
		cmp dword[rcx+4], r8d
		je contCiclo
		
		mov ebx, dword[rcx+4]
		mov [rdx+4], ebx
		add rdx, 4
	
		contCiclo:
		add rcx, 4
		cmp dword[rcx+4], 0
	
	jne ciclo
	
ret




