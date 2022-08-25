; -------------------------------------------------------------------------------------
; assemble: -->> nasm -f win64 -o Programacion3.o Programacion3.asm -l Programacion3.lst
; link:	   -->> gcc -o Programacion3 Programacion3.o 
; -------------------------------------------------------------------------------------

; Nombres y Apellidos: Benjamin Condori Vasquez
; Registro: 220000999


segment .data
; Aqui se declaran las variables inicializadas

	arreglo		dd		2, 2, 0, 0, 0, 0, 9, 9, 9, 1, 9

segment .bss
; Aqui se declaran las variables sin inicializar

	suma	resd	1

segment .text
global main
main:
; Aqui van las instrucciones

	; “índices” del arreglo: 2, 3, 6, 10
	
	xor rax, rax 
	xor rbx, rbx
	
	mov eax, arreglo
	
	add ebx, [eax + 8]
	add ebx, [eax + 12]
	add ebx, [eax + 24]
	add ebx, [eax + 40]
	
	mov [suma], ebx

	ret




