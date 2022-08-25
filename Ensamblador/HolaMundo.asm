
global main
extern printf, scanf

segment .data

	msj	  db 	10, "Hola Mundo", 10, 0

segment .bss



segment .text
main:

sub rsp, 0x20
	
	mov rcx, msj
	call printf
	
add rsp, 0x20

ret












