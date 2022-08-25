
segment .data

	arreglo1  dw  10, 20, -30, 40, -30, 60, 70, 80, -30, -32768
	n 		  dw  10
	eliminar  dw  -30

segment .bss

	arreglo2  resw 50

segment .text
global main
main:

	mov rcx, arreglo1
	mov rdx, arreglo2
	mov r8w, [eliminar]
	mov r9w, [n]
	call eliminar1

ret

eliminar1:

ciclo:	mov ax, [rcx]
		cmp ax, r8w
		jne no_igual

igual:
		mov [rdx], ax
		jmp LL2
	
no_igual:
		mov [rdx], ax
		add rdx, 2
LL2:	add rcx, 2
		dec r9w
		jnz ciclo
		ret





