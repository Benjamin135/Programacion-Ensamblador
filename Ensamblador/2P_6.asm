;--------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 6
;--------------------------------------------------------------------------
; Calcular el promedio de los numeros enteros que sean  
; "pares positivos mayores de 50" que existen en un arreglo 
;--------------------------------------------------------------------------

segment .data

	arreglo  dw  98, 70, 57, -41, -148, 54, 3122, -1034, 462, 22
	num 	 db  10

segment .bss

	promedio  resw 1

segment .text
global main
main:

	mov rcx, arreglo
	mov dl, [num]
	call calPromedio
	mov [promedio], ax

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

calPromedio:
	
	xor r10, r10 		; indice
	xor r11, r11		; acumulador suma
	xor r12, r12		; contador
	xor rbx, rbx

	mov bl, dl
	
	ciclo:
		mov ax, [rcx+r10]
		cmp ax, 0
		jle contCiclo 
	
		cmp ax, 50
		jle contCiclo
		
		cwd
		mov r13w, 2
		idiv r13w	
		cmp edx, 0
		je sumar
		jmp contCiclo
		
		sumar:
			add r11w, [rcx+r10]
	
		contCiclo:
		add r10, 2
		inc r12
		cmp r12b, bl
	
	jl ciclo
	
	mov ax, r11w
	cwd
	idiv bx
	
ret




