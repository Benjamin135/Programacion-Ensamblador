;------------------------------------------------------------------------------------------------------
; PRACTICO DE PROGRAMACION N° 3: ARRAYS Y JUMPS
;------------------------------------------------------------------------------------------------------

segment .data
; Aqui se declaran las variables inicializadas

	registro1	dw		2, 1, 3, 1, 3, 4, 9, 5, 6
	registro	dq		2, 2, 0, 0, 0, 0, 9, 9, 9

segment .bss
; Aqui se declaran las variables sin inicializar

	resultado 	resw	1
	suma		resq	1

segment .text
global main
main:
; Aqui van las instrucciones

	; INDIRECTO POR REGISTRO

	xor rax, rax
	xor rbx, rbx
	
	mov rax, registro
	add rbx, [rax + 16]		; posicion 2
	add rbx, [rax + 24]		; posicion 3
	add rbx, [rax + 40]		; posicion 5
	add rbx, [rax + 64]		; posicion 8
	
	mov [suma], rbx

	; INDIRECTO POR REGISTRO
	xor rax, rax
	xor rbx, rbx
	
	mov rax, registro1
	add bx, [rax + 2]		; posicion 1
	add bx, 10
	add bx, [rax + 6]		; posicion 3
	add bx, 10
	add bx, [rax + 14]		; posicion 7
	add bx, 10
	add bx, [rax + 16]		; posicion 8
	add bx, 10

	mov [resultado], bx
	
	; BASE + INDICE
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rsi, rsi
	
	mov rax, registro1
	mov rsi, 2
	add bx, [rax + rsi]		; posicion 1
	mov rsi, 10
	add bx, [rax + rsi]		; posicion 5
	mov rsi, 14
	add bx, [rax + rsi]		; posicion 7
	
	mov rsi, 0
	add cx, [rax + rsi]		; posicion 0
	mov rsi, 12
	add cx, [rax + rsi]		; posicion 6
	mov rsi, 16
	add cx, [rax + rsi]		; posicion 8
	
	sub bx, cx				
	mov [resultado], bx
	
	ret


