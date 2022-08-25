; -------------------------------------------------------------------------------------
; assemble: -->> nasm -f win64 -o Programacion2.o Programacion2.asm -l Programacion2.lst
; link:	   -->> gcc -o Programacion2 Programacion2.o 
; -------------------------------------------------------------------------------------

; Nombres y Apellidos: Benjamin Condori Vasquez
; Registro: 220000999


segment .data
; Aqui se declaran las variables inicializadas

	a 	dd	8883127		; 0x87 8BB7
	b 	dd	-3000000	; 0xFFD2 3940
	c 	dd 	220000999	; 0xD1C F2E7
	d 	dd 	0xFEDCBA	
	e 	dd 	-150000000	; 0xF70F 2E80

segment .bss
; Aqui se declaran las variables sin inicializar

	x resd	1

segment .text
global main
main:
; Aqui van las instrucciones

	;	x = (a & c) - b ^ d;
	;	x = (x << 5) | (e >> 2);
	;	x = ~x; 
	
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	xor rsi, rsi 
	
	mov eax, [a]
	mov ebx, [b]
	mov ecx, [c]
	mov edx, [d]
	mov esi, [e]
	
	and eax, ecx
	sub eax, ebx
	xor eax, edx
	
	sal eax, 5
	sar esi, 2
	or  eax, esi
	
	not eax
	mov [x], eax

	ret

