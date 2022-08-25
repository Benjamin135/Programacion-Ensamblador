;--------------------------------------------------------------------------
; MODELO EXAMEN FINAL N° 2
;--------------------------------------------------------------------------

global main
extern printf, scanf, gets, strlen

segment .data

	m1	db  10, "Ingresar cantidad de segundos a convertir: ", 0
	m2  db  10, "Tiempo: %d horas, %d minutos, %d segundos", 10, 0
	fmt db  "%d", 0

segment .bss

	nroSegundos  resd  1
	horas	 resd  1
	minutos  resd  1
	segundos resd  1

segment .text
main:
	
sub rsp, 0x20

	mov rcx, m1
	call printf
	
	mov rcx, fmt
	mov rdx, nroSegundos
	call scanf
	
	xor rcx, rcx
	mov ecx, [nroSegundos]
	mov rdx, horas
	mov r8, minutos
	mov r9, segundos
	call convertir
	
	mov rcx, m2
	mov rdx, [horas]
	mov r8, [minutos]
	mov r9, [segundos]
	call printf

add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

convertir:

;   shadow space
;	mov [rsp+8], rcx
;	mov [rsp+16], rdx		; horas
;	mov [rsp+24], r8		; minutos
;	mov [rsp+32], r9		; segundos

	xor rax, rax
	xor rbx, rbx
	xor r10, r10
	
	mov rbx, rdx	; direccion de horas

	mov eax, ecx
	cdq
	mov r10d, 3600
	idiv r10d
	
	; las horas transformadas estan en eax
	; los segundos sobrantes estan en edx
	
;	mov r10, [rsp+16]
;	mov [r10], eax

	mov [rbx], eax  ; pasamos el valor de eax a la variable horas

	mov eax, edx	; movemos segundos sobrantes
	cdq
	mov r10d, 60
	idiv r10d
	
	; las minutos transformadas estan en eax
	; los segundos sobrantes estan en edx
	
	mov [r8], eax	; pasamos el valor de eax a la variable minutos
	mov [r9], edx	; pasamos el valor de eax a la variable segundos

ret
	














