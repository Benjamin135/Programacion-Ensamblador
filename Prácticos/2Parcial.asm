;--------------------------------------------------------------------------
; assemble: -->> nasm -f win64 -o 2Parcial.o 2Parcial.asm -l 2Parcial.lst
; link:	   -->> gcc -o 2Parcial 2Parcial.o 
; -----------------------------------------------------------------------------
; Nombre: Benjamin Condori Vasquez  
; Registro: 2Parcial
; -----------------------------------------------------------------------------

segment .data

	arreglo1   dw   10, 20, -30, 40, -30, 60, 70, 80, -30, -32768
	eliminar   dw   -30
	n	       db   10

segment .bss

	arreglo2  resw  10

segment .text
global main
main:

	mov rcx, arreglo1
	mov rdx, arreglo2
	mov r8w, [eliminar]
	mov r9w, [n]
	call eliminar1

ret

; --------------------------------------------------------------------------
; .....................Subrutinas.....................
; --------------------------------------------------------------------------

eliminar1:

	xor r10, r10		; contador
	xor rbx, rbx
	
	mov r11, rdx

	cmp word[rcx], r8w
	je disminuir
	mov ax, word[rcx]
	mov word[rdx], ax
	jmp ciclo
	
	disminuir:
	sub rdx, 2
	
	ciclo:
	
		cmp word[rcx+2], r8w
		je contCiclo
		
		mov ax, word[rcx+2]
		mov word[rdx+2], ax
		add rdx, 2
		
		contCiclo:
		add rcx, 2
		inc r10
		cmp r10w, r9w
			
	jl ciclo
	
	

ret


