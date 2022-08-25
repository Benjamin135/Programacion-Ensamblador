;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file: add.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a	DW	0x970A		;SS= 38666	CS= -26870
b	DW	0xA1F3		;SS= 41459	CS= -24077
					;--------	;---------
					;    80125	;   -50947

;a + b = 0x970A + 0xA1F3 = 0x1_38FD -->>resultado 14589
;banderas: C=1, Z=0, S=0, O=1
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar
c	resw 1

segment .text 
global main 					
main:
;-------inmediato (r/inm)-------------------------------------
		xor eax, eax
		mov ax,  0x970A
		add ax,  0xA1F3		;ax= 0x38FD banderas: C=1, Z=0, S=0, O=1
		mov [c], ax
		
;-------inmediato (m/inm)-------------------------------------
		xor eax, eax
		mov word[c],  0x970A
		add word[c],  0xA1F3		;ax= 0x38FD banderas: C=1, Z=0, S=0, O=1
				
;-------directo (r/m)---------------------------------------
		xor eax, eax
		mov ax, [a]		;ax= 0x970A
		add ax, [b]		;ax= 0x38FD	banderas: C=1, Z=0, S=0, O=1
		mov [c], ax
		
;-------registro (r/r)---------------------------------------
		xor eax, eax
		mov ax, [a]		;ax= 0x970A
		mov bx, [b]		;ax= 0xA1F3
		add ax, bx		;ax= 0x38FD	banderas: C=1, Z=0, S=0, O=1
		mov [c], ax
		
;-------indirecto por registro-------------------------
		xor eax, eax
		mov ebx, a		;ebx= 0x00403010 direccion
		mov ax, [ebx]	;ax= 0x970A
		add ax, [ebx+2]	;ax= 0x38FD	banderas: C=1, Z=0, S=0, O=1
		mov [c], ax

;-------base + indice----------------------------------
		xor eax, eax
		mov ebx, a		;ebx= 0x00403010 direccion
		mov edx, 0		;indice
		mov ax, [ebx+edx];ax= 0x970A
		add edx, 2
		add ax, [ebx+edx];ax= 0x38FD	banderas: C=1, Z=0, S=0, O=1
		mov [c], ax
		
;-------indice escalado--------------------------------
		xor eax, eax
		mov ebx, a		;ebx= 0x0040310 direccion
		mov edx, 0		;indice
		mov ax, [ebx+edx*2]	;ax= 0x970A
		add edx, 1
		add ax, [ebx+edx*2]	;ax= 0x38FD	banderas: C=1, Z=0, S=0, O=1
		mov [c], ax
		ret
	




