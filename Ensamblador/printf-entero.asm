
global main
extern printf, scanf

segment .data

	a     dq	-123456789
	fmt1  db 	10, "%d", 10, 0				; 64 bits --> "%lld"  (long long)
	fmt2  db	10, "0x%X", 10, 0			; dato en Hexadecimal
	
	msj1  db 	10, "El número en DEC es: %d", 10, 0		; 32 bits -> "%d" (int)
	msj2  db 	10, "El número en DEC es: %lld", 10, 0		; 64 bits -> "%lld" (long long)
	msj3  db 	10, "El número en HEX es: 0x%X", 10, 0		; 32 bits -> "%X" (int)

segment .bss



segment .text
main:

sub rsp, 0x20

	mov rcx, msj1		; por referencia
	mov rdx, [a]		; por valor
	call printf
; -----------------------------------------	
	mov rcx, msj2
	mov rdx, [a]
	call printf
; -----------------------------------------		
	mov rcx, msj3
	mov rdx, [a]
	call printf

add rsp, 0x20

ret








