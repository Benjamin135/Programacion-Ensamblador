;------------------------------------------------------
;assemble: -->> nasm -f win64 -o Programacion1.o Programacion1.asm -l Programacion1.lst
;link:	   -->> gcc -o Programacion1 Programacion1.o
;-----------------------------------------

;file: Programacion1.asm (nombre programa)
;Registro: Programacion1
;Nombres y Apellidos: Benjamin Condori Vasquez

extern printf, scanf

segment .data
;aqui se declaran las variables inicializadas

	t1	dd	  220000999
	t2	dd	  -25
	t3  dd	  8883127

segment .bss
;aqui se declaran las variables sin inicializar

	t4 resd	  1

segment .text
global main
main:
;aqui van las instrucciones
	
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	
	mov eax, [t1]
	mov ebx, [t2]
	mov ecx, [t3]
	
	add eax, 10
	sub ebx, 20
	sub eax, ebx
	
	sub eax, 30
	neg ecx
	sub eax, ecx
	mov [t4], eax
	

ret





	