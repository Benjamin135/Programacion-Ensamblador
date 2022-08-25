
global main
extern printf, scanf, strlen, gets

segment .data

	m1    db    10, "Ingresar una cadena (max. 50 caracteres): ", 0
	m2    db    "La longitud de la cadena es: %d", 10, 0
	fmt   db    "%s", 0

segment .bss

	cadena   resb  50

segment .text
main:

sub rsp, 0x20

	mov rcx, m1
	call printf
	
	mov rcx, cadena
	call gets
	
	mov rcx, cadena
	call strlen
	
	mov rcx, m2
	mov rdx, rax
	call printf

add rsp, 0x20

ret









