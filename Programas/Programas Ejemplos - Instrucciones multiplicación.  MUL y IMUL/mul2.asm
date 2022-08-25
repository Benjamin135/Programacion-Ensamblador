;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

segment .data
bNumA	 db 42
bNumB	 db 73

wNumA	 dw 4321
wNumB	 dw 1234

dNumA	 dd 42000
dNumB	 dd 73000

qNumA	 dq 420000
qNumB	 dq 730000

;Para realizar las operaciones básicas de:

;wAns = bNumA^2 ; bNumA al cuadrado.
;bAns1 = bNumA * bNumB
;wAns1 = bNumA * bNumB
;wAns2 = wNumA * wNumB
;dAns2 = wNumA * wNumB
;dAns3 = dNumA * dNumB
;qAns3 = dNumA * dNumB
;qAns4 = qNumA * qNumB
;dqAns4 = qNumA * qNumB	
	
segment .bss
wAns	 resw 1
wAns1	 resw 1
dAns2	 resd 1
qAns3	 resq 1 
dqAns4	 resq 1

segment .text 

global main 					
main:
;-----------------------------------	
	mov al, [bNumA]
	mul al			 ; resultado in ax
	mov [wAns], ax

	nop
	mov al, [bNumA]
	mul byte [bNumB] ; resultado in ax
	mov [wAns1], ax

	nop
	mov ax, [wNumA]
	mul word [wNumB] ; resultado in dx:ax
	mov [dAns2], ax
	mov [dAns2+2], dx

	nop
	mov eax, [dNumA]
	mul dword [dNumB] ; resultado in edx:eax
	mov [qAns3], eax
	mov [qAns3+4], edx

	nop
	mov rax, [qNumA]
	mul dword [qNumB] ; resultado in rdx:rax
	mov [dqAns4], rax
	mov [dqAns4+8], rdx
	ret





