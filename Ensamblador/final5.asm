;--------------------------------------------------------------------------
; MODELO EXAMEN FINAL N° 5
;--------------------------------------------------------------------------

global main
extern printf, scanf, gets, strlen

segment .data

	m1   db   10, "Ingresar la cadena de caracteres (máx. 100 caracteres): ", 0
	m2   db   10, "La cadena contiene un conjunto balanceado de paréntesis", 10, 0
	m3   db   10, "La cadena NO contiene un conjunto balanceado de paréntesis", 10, 0

segment .bss

	cadena   resb  100

segment .text
main:

sub rsp, 0x20
	
	mov rcx, m1
	call printf
	
	mov rcx, cadena
	call gets
	
	mov rcx, cadena
	call strlen
	
	mov rcx, cadena
	mov rdx, rax
	call isBalanceado
	
	cmp rax, 1
	je Balanceado
	jmp noBalanceado
	
	Balanceado:
	mov rcx, m2
	call printf
	
	jmp finMain
	
	noBalanceado:
	mov rcx, m3
	call printf
	
	finMain:
	
add rsp, 0x20

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

isBalanceado:

	mov rbx, rcx		; direccion de la cadena en rbx
	mov rcx, rdx

	xor r15, r15		; contador
	xor rax, rax

	ciclo:
	
		mov al, [rbx]
		cmp al, 0x28
		je parentesisAbierto
		jmp compParentCerrado
			
		parentesisAbierto:
			inc r15
		jmp fin
		
		compParentCerrado:
		cmp al, 0x29
		je esParentesisCerrado
		jmp fin
		
		esParentesisCerrado:
			dec r15
			
		; preguntar caso especial si es -1
			cmp r15, -1
			je errorParentesis
		
		fin:
		inc rbx
		
	loop ciclo

cmp r15, 0
je siSeBalanceo

errorParentesis:
mov rax, 0
jmp finBalanceo

siSeBalanceo:
mov rax, 1

finBalanceo:

ret






