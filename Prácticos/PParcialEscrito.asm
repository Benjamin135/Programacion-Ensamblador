
segment .data

	aa	db  "Byte"
	bb	db  -121
	cc  db  +32

segment .bss



segment .text
global main
main:	XOR EAX, EAX
		XOR EBX, EBX
		xor ECX, ECX
		MOV AL, [aa]
		MOV BL, [aa+2]
		MOV CL, [aa+4]
		CMP AL, BL
		JNC LL1
		CMP BL, CL
		JNS LL2
		MOV [bb], BL
		JMP LL4
LL2:	XOR AL, 0x5A
		MOV [cc], AL
		JMP LL4
LL1:	CMP AL, CL
		JC LL3
		MOV [cc],AL
		JMP LL4
LL3:	MOV [bb], CL
LL4:	RET


