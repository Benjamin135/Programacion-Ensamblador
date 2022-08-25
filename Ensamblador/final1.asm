;--------------------------------------------------------------------------
; MODELO EXAMEN FINAL N° 1
;--------------------------------------------------------------------------
;Escribir un programa el cual permita ingresar una cadena de caracteres por teclado (puede
;contener letras mayúsculas y/o minúsculas, dígitos, caracteres especiales, espacios), con una
;longitud máxima de 100 (cien) caracteres. El programa deberá contar el número total de
;“letras mayúsculas y minúsculas” y los “dígitos numéricos” que se encuentran en la cadena
;introducida (no se debe contar los caracteres especiales). A tal fin el programa principal llamará
;a una “subrutina” de nombre “Contar” la cual realizará dicho conteo. Los parámetros a la
;subrutina se pasarán en el siguiente orden respectando las Convenciones de Llamada de
;Microsoft x64 ABI (Application Binary Interface):
;--------------------------------------------------------------------------
; nasm -f win64 -o final1.o final1.asm -l final1.lst
; gcc -o final1 final1.o
;--------------------------------------------------------------------------

global main
extern printf, scanf, gets, strlen

segment .data

	m1	db	10, "Ingresar la cadena de caracteres (máx 100 caracteres): ", 0
	m2	db  10, "La cadena tiene un total de: %d (digítos + letras mayúsculas + minúsculas)", 10, 0

;	m3	db	10, "La cadena ingresada es: %s", 10, 0
;	fmt	db  "%s", 0

segment .bss

	cadena	resb   100

segment .text
main:

sub rsp, 0x20

; ------ PRINTF ------		// Muestra el mensaje m1
	mov rcx, m1
	call printf
	
; ------ SCANF ------		// Escanea la cadena solo hasta el primer espacio
;	mov rcx, fmt
;	mov rdx, cadena
;	call scanf

; ------ GETS ------		// Escanea todo la cadena 
	mov rcx, cadena
	call gets
	
; ------ STRLEN ------		// Devuelve la longitud de la cadena en RAX
	mov rcx, cadena
	call strlen
	
; ------ SUBRUTINA ------	// Llama a la subrutina Contar
	mov rcx, cadena
	mov rdx, rax
	call Contar
	
; ------ PRINTF ------		// Mustra el mensaje m3 y la cadena escaneada
;	mov rcx, m3
;	mov rdx, cadena
;	call printf

; ------ PRINTF ------
	mov rcx, m2
	mov rdx, rax
	call printf

add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

Contar:

	mov rbx, rcx		; direccion de la cadena en RBX
	mov rcx, rdx		; iterador
	
	xor rax, rax
	xor r12, r12		; acumulador de la suma
	
	ciclo:
	
		mov al, [rbx]
		cmp al, 0x30
		jl verificarMayuscula
		cmp al, 0x39
		jle contar
		
		verificarMayuscula:
		cmp al, 0x41
		jl verificarMinuscula
		cmp al, 0x5A
		jle contar
		
		verificarMinuscula:
		cmp al, 0x61
		jl siguiente
		cmp al, 0x7A
		jle contar
		jmp siguiente
		
		contar:
			inc r12
			
		siguiente:
			inc rbx
	
	loop ciclo
	
	mov rax, r12

ret







