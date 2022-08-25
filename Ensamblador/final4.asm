;--------------------------------------------------------------------------
; MODELO EXAMEN FINAL N° 4
;--------------------------------------------------------------------------

global main
extern printf, scanf, gets, strlen

segment .data

	m1   db   10, "Ingresar la cadena de caracteres (máx. 100 caracteres): ", 0
	m2   db   10, "La nueva cadena copiada es: %s", 10, 0
;	m3   db   10, "La longitud es: %lld", 10, 0
;	m4   db   10, "La cadena ingresada es: %s", 10, 0
	

segment .bss

	cad1    resb   100
	cad2    resb   100

segment .text
main:

sub rsp,0x20

	mov rcx, m1			; Muestra el mensaje "m1"
	call printf
	
	mov rcx, cad1		; Obtiene toda la cadena "cad1"
	call gets

;	mov rcx, m4
;	mov rdx, cad1
;	call printf
	
	mov rcx, cad1		; Devuelve la longitud de la cadena "cad1"
	call strlen

;	mov rcx, m3
;	mov rdx, rax
;	call printf
	
	mov rcx, cad1		; referencia
	mov rdx, cad2		; referencia
	mov r8, rax			; valor
	call copyCad

	mov rcx, m2			; Muestra el mensaje "m2" concatenada con la cadena "cad2"
	mov rdx, cad2
	call printf

add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

copyCad:

	mov rbx, rcx      ; direccion de la cad1 en rbx
	mov rcx, r8		  ; iterador
	
	xor rax, rax

	ciclo:
	
		mov al, [rbx]
		cmp al, 0x30
		jb noCopiar
		cmp al, 0x39
		jbe siCopiar
		
		cmp al, 0x41
		jb noCopiar
		cmp al, 0x5A
		jbe siCopiar
		
		cmp al, 0x61
		jb noCopiar
		cmp al, 0x7A
		jbe siCopiar
		jmp noCopiar
		
		siCopiar:
			mov [rdx], al
			inc rdx
		
		noCopiar:
			inc rbx
	
	loop ciclo

ret






