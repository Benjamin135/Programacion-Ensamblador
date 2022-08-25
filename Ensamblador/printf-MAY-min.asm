
global main
extern printf, strlen, gets

segment .data

	m1	 db   10, "Introducir su nombre y apellido en MAYUSCULAS: ", 0
	m2   db   "Su nombre y apellido en minusculas es: %s", 10, 0

segment .bss

	cadena   resb  50

segment .text
main:

sub rsp, 0x20

; ------ PRINTF ------
	mov rcx, m1
	call printf
	
; ------ GETS ------
	mov rcx, cadena
	call gets
	
; ------ STRLEN ------
	mov rcx, cadena
	call strlen
	
; ------ CICLO ------
	mov rbx, cadena
	mov rcx, rax
	ciclo:
		mov al, [rbx]
		or al, 0x20
		mov [rbx], al
		inc rbx
	loop ciclo
	
; ------ PRINTF ------
	mov rcx, m2
	mov rdx, cadena
	call printf

add rsp, 0x20

ret











