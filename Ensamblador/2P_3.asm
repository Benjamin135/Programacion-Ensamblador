;--------------------------------------------------------------------------
; MODELO EXAMEN SEGUNDO PARCIAL N° 3
;--------------------------------------------------------------------------

segment .data

	a	dd	16
	b	dd  14

segment .bss

	mcd	 resd  1

segment .text
global main
main:

	mov ecx, [a]
	mov edx, [b]
	call calcular
	mov [mcd], eax

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

calcular:

	xor rax, rax
	xor rbx, rbx
	xor r10, r10		; sera el mcd
	
	mov r11d, ecx		; r11d = a
	mov ebx, edx		; ebx = b
	
	ciclo:
			mov eax, r11d
			cdq
			idiv ecx
			cmp edx, 0
			
		je segundo
		jmp contCiclo
		
			segundo:
			mov eax, ebx
			cdq
			idiv ecx
			cmp edx, 0
			je guardarMCD
			jmp contCiclo
			
			guardarMCD:
				mov r10d, ecx
				jmp fin
	
		contCiclo:
		
	loop ciclo
	
	fin: mov eax, r10d
	
ret





