;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: add-program-reg.asm

;.text=   0X00401550
;.data=   0x00403010

;-------------------------------------------	
;Simple example demonstrating basic program
;format and layout.
;******************************************
;Some basic data declarations

;Define constants
byte11 equ 8 ; byte = 8

segment .data
; -----
  
;Byte (8bit) variable declarations
byte1	 db 17
byte2	 db 9

;Word (16bit) variable declarations
word1	 dw 17000
word2	 dw 9000

;Doubleword(32bit) variable declarations
double1	 dd 17000000
double2	 dd 9000000

;Quadword (64bit) variable declarations
quadword1	 dq 170000000
quadword2	 dq 90000000

;***************
segment .bss
bResult	 resb 1
wResult	 resw 1
dResult	 resd 1
qResult	 resq 1

;**************** 
; Code Section

section .text
global main 					
main:

;Performs a series of very basic addition operations
;to demonstrate basic program format.
;-----
;Byte example
;bResult = byte1 + byte2

mov al, [byte1]
mov bl, [byte2]
add al, bl
mov [bResult], al

;-----
;Word example
;wResult = word1 + word2

mov ax, [word1]
mov bx, [word2]
add ax, bx
mov [wResult], ax

;-----
;Doublewordexample
;dResult = double1 + double2

mov eax,[double1]
mov ebx, [double2]
add eax, ebx
mov [dResult], eax

;-----
;Quadword example
;qResult = quadword1 + quadword2

mov rax, [quadword1]
mov rbx, [quadword2]
add rax, rbx
mov [qResult], rax

;***********************
;fin, terminate program.
ret





