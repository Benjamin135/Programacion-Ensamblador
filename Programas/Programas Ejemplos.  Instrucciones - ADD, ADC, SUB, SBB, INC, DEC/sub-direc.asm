;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: sub-direc.asm

segment .data
byte1	 db 73
byte2	 db 42

word1	 dw 1234
word2	 dw 4321

double1	 dd 73000
double2	 dd 42000

quadword1	 dq 73000000
quadword2	 dq 73000000

;bAns = byte1 - byte2
;wAns = word1 - word2
;dAns = double1 - double2
;qAns = quadword1 - quadword2
		
segment .bss
bAns	 db 0
wAns	 dw 0
dAns	 dd 0
qAns	 dq 0

segment .text 

global main 					
main:
;---------------------	
; bAns = byte1 - byte2
mov al, [byte1]
sub al, [byte2]
mov [bAns], al

; wAns = word1 - word2
mov ax, [word1]		;C=1 (prestamo) S=1
sub ax, [word2]	
mov [wAns], ax

; dAns = double1 - double2
mov eax, [double1]
sub eax, [double2]
mov [dAns], eax

; qAns = quadword1 - quadword2
mov rax,[quadword1]
sub rax,[quadword2]
mov [qAns], rax		;Z=1

ret





