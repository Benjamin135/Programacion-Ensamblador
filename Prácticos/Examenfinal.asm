;--------------------------------------------------------------------------
; assemble: -->> nasm -f win64 -o Examenfinal.o Examenfinal.asm -l Examenfinal.lst
; link:	   -->> gcc -o Examenfinal Examenfinal.o 
;--------------------------------------------------------------------------
; Nombres y Apellidos: Benjamin Condori Vasquez
; Registro: Examenfinal
;--------------------------------------------------------------------------

global main
extern printf, scanf, gets, strlen

segment .data

	m1	db  10, "Ingresar cadena (máx. 20 caracteres): ", 0
	m2  db  10, "Nueva cadena: %s", 10, 0

segment .bss

	cadena1  resb  20
	cadena2  resb  20

segment .text
main:

sub rsp, 0x20

	mov rcx, m1
	call printf
	
	mov rcx, cadena1
	call gets
	
	mov rcx, cadena1
	call strlen
	
	mov rcx, cadena1
	mov rdx, cadena2
	call copiar
	
	mov rcx, m2
	mov rdx, cadena2
	call printf

add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

copiar:
	
	mov rbx, rcx	; direccion de la cadena1
	mov rcx, rax
	
	xor rax, rax
	
	ciclo:
	
		mov al, [rbx]
		cmp al, 0x30
		jl noCopiar
		cmp al, 0x39
		jle siCopiar
		jmp noCopiar
		
		siCopiar:
			mov [rdx], al
			inc rdx
		
		noCopiar:
			inc rbx
	
	loop ciclo

ret



