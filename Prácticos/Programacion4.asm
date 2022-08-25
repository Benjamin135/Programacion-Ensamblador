;--------------------------------------------------------------------------
; assemble: -->> nasm -f win64 -o Programacion4.o Programacion4.asm -l Programacion4.lst
; link:	   -->> gcc -o Programacion4 Programacion4.o 
;--------------------------------------------------------------------------
; Nombres y Apellidos: Benjamin Condori Vasquez
; Registro: 220000999
;--------------------------------------------------------------------------

segment .data
; Aqui se declaran las variables inicializadas

	a 	dd 	2
	b	dd 	5

segment .bss
; Aqui se declaran las variables sin inicializar

	x 	resd  1

segment .text
global main
main:
; Aqui van las instrucciones

	xor rcx, rcx
	xor rdx, rdx
	
	mov ecx, [a]
	mov edx, [b]
	call calcular
	mov [x], eax

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

calcular:
	;x = ((-a) * b3) / 7
	neg ecx
	mov r10d, edx
	imul edx, r10d
	imul edx, r10d
	imul ecx, edx
	mov eax, ecx
	cdq
	mov r11d, 7
	idiv r11d
ret 






