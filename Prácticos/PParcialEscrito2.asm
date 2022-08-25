
segment .data

	arreglo   DB  0X0A, 0XEC, 0X1E, 0XF5 
	cadena 	  DB  "bit5"

segment .bss

segment .text
global main
main:

		MOV EAX, 0
		MOV EBX, 0
		MOV ECX, 0
		MOV EDX, 0

		MOV DL, [cadena+3]
		XOR DL, 0X30
		MOV ECX, arreglo
		MOV AL, [ECX]
		MOV EBX, 0X0
		CMP EBX, EDX
		JGE .EE3

.EE1:	
		CMP [ECX+EBX*1], AL
		JGE .EE2
		MOV AL, [ECX+EBX*1]
		
.EE2:
		INC EBX
		CMP EBX, EDX
		JL .EE1
		
.EE3:	
		MOV [ECX+4], AL
		SAL AL, 3

		RET
