;--------------------------------------------------------------------------
; MODELO EXAMEN FINAL N° 2
;--------------------------------------------------------------------------
; Escribir un programa cuyo objetivo es calcular dado un arreglo de números, cuáles de ellos
; son divisibles por otro determinado número. Esta subrutina recibe los parametros que se
; describen a continuacion en el orden indicado:

; 1) Dirección del arreglo a procesar (referencia)
; 2) Dirección del nuevo arreglo que contendrá los elementos divisibles (referencia)
; 3) Número del cual queremos obtener los divisibles que se encuentran en el arreglo (valor)

; Ejemplo:   arreglo:    4, 7, 33, 515, 49, 63, 39, 0
;			 numero:     7 
; 			 divisibles: 7, 49, 63

global main
extern printf, scanf 

segment .data

	arreglo	 dd   4, 7, 33, 515, 49, 63, 39, 0
	m1    	 db   10, "Ingresar número: ", 0
	m2       db   10, "Divisibles: %d", 10, 0
	fmt		 db   "%d", 0

segment .bss

	numero   resd  1
	divisibles  resd   100

segment .text
main:

sub rsp, 0x20

	mov rcx, m1
	call printf
	
	mov rcx, fmt
	mov rdx, numero
	call scanf
	
	mov rcx, arreglo
	mov rdx, divisibles
	mov r8, [numero]
	call CalculaDivisibles
	
	mov rcx, m2
	mov rdx, [divisibles]
	call printf

add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

CalculaDivisibles:

	mov rbx, rcx 		; direccion de arreglo en rbx
	mov r10, rdx		; direccion de divisibles en r10
	xor rax, rax
	
	ciclo:
	
		mov eax, [rbx]
		cdq
		idiv r8d
		cmp edx, 0
		jne siguiente
		
		mov [rdx], eax
		add r10, 4
				
		siguiente:
			add rbx, 4
			
		cmp 
	
	jne ciclo

ret















