
global main
extern printf, gets

segment .data

	msj    db    10, "Ingresa una cadena (max. 50 caracteres): ", 0
	msj1   db    10, "Ingresa tu nombre y apellido (max. 50 caracteres): ", 0
	msj2   db    "La cadena ingresada es: %s", 10, 0
	;fmt	   db    "%s", 0		; -> No es necesario el formato

segment .bss

	cadena   resb   50

segment .text
main:

sub rsp, 0x20

	mov rcx, msj1
	call printf

	mov rcx, cadena		; por referencia
	call gets
	
	mov rcx, msj2		; por referencia
	mov rdx, cadena		; por referencia
	call printf

add rsp, 0x20

ret












