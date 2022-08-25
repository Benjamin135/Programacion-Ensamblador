;------------------------------------------------------
;assemble: -->> nasm -f win64 -o Ensamblador.o Ensamblador.asm -l Ensamblador.lst
;link:	   -->> gcc -o Ensamblador Ensamblador.o
;-----------------------------------------

;file: Ensamblador.asm (nombre programa)
;registro
;nombres y apellidos

extern printf, scanf

segment .data
;aqui se declaran las variables inicializadas

	a 	dd		8883127
	b 	dd		-10
	c 	dd		220000999

segment .bss
;aqui se declaran las variables sin inicializar

	x 	resd 	1

segment .text

global main:
main:
;aqui van las instrucciones

	xor rax, rax		; Limpiando registros
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	
	mov eax, [a]		; eax = a = 8883127
	mov ebx, [b]		; ebx = b = -10
	mov ecx, [c]		; ecx = c = 220000999
	
	mov edx, 40			; edx = 40
	
	sub edx, eax		; edx = 40 - a
	neg ebx				; ebx = (-(-10)) = 10 
	sub edx, ebx		; edx = (40-a) - (-b)
	mov [x], edx		; x = edx = (40-a) - (-b)
	
	add edx, 10			; edx = x + 10
	add ecx, 20			; ecx = c + 20
	add edx, ecx		; edx = (x+10) + (c+20)
	
	inc edx				; x++
	mov [x], edx		; x = edx


ret
	
	
	
	