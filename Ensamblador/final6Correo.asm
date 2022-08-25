;--------------------------------------------------------------------------
; MODELO EXAMEN FINAL N° 6
;--------------------------------------------------------------------------
; Verificar si una cadena introducida es un correo
;--------------------------------------------------------------------------

global main
extern printf, scanf, gets, strlen

segment .data

	m1   db   10, "Introduzca la cadena a analizar: ", 0
	m2   db   10, "La cadena introducida NO es un correo", 10, 0
	m3   db   10, "La cadena introducida es un correo", 10, 0
	fmt  db   "%s", 0

segment .bss

	cadena  resb  100

segment .text
main:

sub rsp, 0x20

	mov rcx, m1
	call printf
	
	mov rcx, cadena
	call gets
	
	mov rcx, cadena
	call strlen
	
	mov rcx, cadena
	mov rdx, rax
	call detectorCorreo
	
	cmp rax, 0
	je noEsCorreo
	jmp siEsCorreo
	
	noEsCorreo:
	mov rcx, m2
	call printf
	jmp fin
	
	siEsCorreo:
	mov rcx, m3
	call printf
	
	fin:

add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

detectorCorreo:

	mov rbx, rcx
	mov rcx, rdx
	
	xor rax, rax
	xor r10, r10
	xor r11, r11

	ciclo:
	
		mov al, [rbx]
		cmp al, 0x40		; comparar primero el arroba
		je encontroArroba
		cmp al, 0x2E
		je encontroPunto
		jmp continuar
		
		encontroArroba:
			mov r10, 1
			jmp continuar
			
		encontroPunto:
			cmp r10, 1
			je siEncontroArroba
			jmp continuar
		
		siEncontroArroba:
			mov r11, 1
		
		continuar:
		inc rbx
	
	loop ciclo

cmp r10, r11
jne NoEsCorreo
mov rax, 1
jmp final

NoEsCorreo:
mov rax, 0

final:

ret





