
segment .data

	cadena   DB   "bit32", 0

segment .bss

	

segment .text
global main

main:   PUSH cadena
		CALL LL1
		PUSH RAX
		CALL LL2
		NOP        ; --> 2da. NO OPERACION
		ADD ESP, 8
		RET
	; ------------------------------------
LL1:	PUSH RBP
		MOV EBP, ESP
		MOV EAX, '2'
		AND EAX, 0x0F
		POP RBP
		RET
	; ------------------------------------
LL2:	PUSH RBP 
		MOV EBP, ESP
		MOV ECX, [EBP+8]
		MOV EBX, 0
		MOV EDX, [EBP+12]
LL3:	MOV BL, [EDX]
		SUB BL, 0x60
		CMP BL, 9
		JA LL4
		ADD EAX, EBX
LL4:	INC EDX
		LOOP LL3
		SHL EAX, 2
		NOP			; --> 1ra. NO OPERACION
		MOV EBX, [EBP+12]
		MOV [EBX], AL
		POP RBP
		RET



