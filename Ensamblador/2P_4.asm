;--------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 4
;--------------------------------------------------------------------------
; Calcular el promedio de los numeros posivos que sean "mayores a 50 
; y menores o iguales a 2000" en un arreglo 
;--------------------------------------------------------------------------

segment .data

	arreglo   dw   180, 70, 55, 41, 145, 51, 3121, 1034, 461, 22
	num 	  db   10

segment .bss

	promedio   resw  1

segment .text
global main
main:

	mov rcx, arreglo
	mov dl, [num]
	call promediar
	mov [promedio], ax

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

promediar:

	xor r10, r10 	; indice
	xor rax, rax	; acumulador "suma"
	xor rbx, rbx

	ciclo:
		cmp word[rcx+r10*2], 50
		jg menor2000
		jmp contCiclo
		
		menor2000:
			cmp word[rcx+r10*2], 2000
			jle	sumar
			jmp contCiclo
		
		sumar:
			add ax, [rcx+r10*2]
		
		contCiclo:
		inc r10
		cmp r10b, dl
		
	jl ciclo
	
	mov bl, dl
	cwd
	idiv bx
	
ret









