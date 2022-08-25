;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)
;registro:
;nombres y apellidos:

;file: adc.asm

segment .data
;a		;  420_000_000_000_000_000_000		;0x0000000000000016 C4ABBEBEA0100000
;b		;  730_000_000_000_000_000_000		;0x0000000000000027	92C8FC4B53280000
;c=a+b	;1_150_000_000_000_000_000_000		;0x000000000000003E 5774BB09F3380000
	
n1L	dq 0xC4ABBEBEA0100000	;420_000_000_000_000_000_000		;0x0000000000000016 C4ABBEBEA0100000
n1H	dq 0x0000000000000016	;730_000_000_000_000_000_000		;0x0000000000000027	92C8FC4B53280000
n2L	dq 0x92C8FC4B53280000	
n2H	dq 0x0000000000000027
		
segment .bss
n3L	resq 1
n3H	resq 1

segment .text 
global main 			  		
main:
;---------------------	
; c = a + b
	mov rbx, [n1L]	
	mov rax, [n1H]
	
	mov rdx, [n2L]	
	mov rcx, [n2H]	
	
	add rdx, rbx		
	adc rcx, rax	;adc -->> suma con acarreo rcx=rcx+rax+C		 

	mov [n3L], rdx	;0x5774BB09F3380000
	mov [n3H], rcx	;0x000000000000003E
ret





