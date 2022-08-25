;-----------------------------------------------------------------------------
; MODELO EXAMEN PRIMER PARCIAL - N°3
;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------
; PROMEDIO DE LOS ELEMENTOS POSITIVOS DE UN VECTOR
;-----------------------------------------------------------------------------

segment .data

	a	dd	1151, 220000999, 319, -2200, 20764, 8883127, -609, 19, 11990, -55

segment .bss

	promedio resd	1

segment .text
global main
main:

	xor rax, rax
	xor rcx, rcx		
	xor rsi, rsi		; indice
	xor rbx, rbx		; acumulador de suma
	xor r9, r9 			; obtiene elemento del vector
	
	mov rax, a
	mov rcx, 10
	
	ciclo:
		mov r9d, [rax + rsi]
		cmp r9d, 0
		jns sumar
			
		sig:
			add rsi, 4
			dec rcx
			jz fin
			jmp ciclo
		
		sumar:
			add ebx, r9d
			jmp sig
	
	fin:
	
	mov eax, ebx
	
	cdq
	mov r10d, 10
	idiv r10d
	
	mov [promedio], eax
	
	ret



