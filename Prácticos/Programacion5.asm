;--------------------------------------------------------------------------
; assemble: -->> nasm -f win64 -o 220000999.o 220000999.asm -l 220000999.lst
; link:	   -->> gcc -o 220000999 220000999.o 
;--------------------------------------------------------------------------
; Nombres y Apellidos: Benjamin Condori Vasquez
; Registro: 220000999
;--------------------------------------------------------------------------

global main
extern printf, scanf

segment .data

	a    dd    2000
	b    dd    1005
	msj  db  10, "residuo = %d", 10, 0

segment .bss

	producto   resd   1
	residuo    resd   1

segment .text
main:

sub rsp, 0x20

	mov ecx, [a]
	mov edx, [b]
	mov r8, producto
	mov r9, residuo
	call calcular
	
	mov rcx, msj
	mov rdx, [residuo]
	call printf

add rsp, 0x20

ret

;-------------------------------
; Subrutinas
;-------------------------------

calcular:

	mov ebx, ecx
	mov r10d, edx
	
	imul ebx, r10d
	mov [r8], ebx
	
	mov eax, ecx
	cdq 
	idiv r10d
	mov [r9], edx

ret








