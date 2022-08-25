
segment .data

	cadena 	db	"BENJAMIN CONDORI", 0

segment .bss

	cadena2  resb 16 

segment .text
global main
main:

	mov rcx, cadena
	mov rdx, cadena2
	call cambiar

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

cambiar:

	ciclo: 	mov al, [rcx]	; indirecto por registro
			cmp al, 0		; fin de cadena?
			je fin
			cmp al, 0x20		; 0x20 -> espacio 
			je cont
			add al, 0x20		; sumar 0x20 -> minuscula
		cont:	
			mov [rdx], al
			inc rcx			; incrementa la direccion
			inc rdx
			jmp ciclo		; salta si ZF=0
    fin:
	
ret