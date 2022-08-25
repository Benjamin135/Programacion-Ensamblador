
global main
extern printf, scanf

segment .data

	msj1	db 		10, "Ingresar un número entero (decimal): ", 0
	msj2	db		"El número ingresado es: %lld", 10, 0
	fmt		db		"%d", 0

segment .bss

	numero  resq   1

segment .text
main:

sub rsp, 0x20

	mov rcx, msj1
	call printf

	mov rcx, fmt		; por referencia
	mov rdx, numero		; por referencia
	call scanf
	
	mov rcx, msj2
	mov rdx, [numero]
	call printf

add rsp, 0x20

ret













