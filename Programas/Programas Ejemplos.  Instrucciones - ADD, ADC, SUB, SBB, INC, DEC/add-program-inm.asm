;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: add-program-inm.asm

;------------------------------------------	
;Simple example demonstrating basic program
;format and layout.
;******************************************
;Some basic data declarations

;  Define constants
byte11 equ 8 ; byte = 8

segment .data

segment .bss
bResult	 resb 1
wResult	 resw 1
dResult	 resd 1
qResult	 resq 1

;***************************************************  
;Code Section

section .text
global main 					
main:

;Performs a series of very basic addition operations
;to demonstrate basic program format.
; -----
;Byte example
;bResult = 17 + 9

mov al, 17
add al, 9
mov [bResult], al
; -----
;Word example
;wResult = 17000 + 9000

mov ax, 17000
add ax, 9000
mov [wResult], ax

; -----
;Doublewordexample
;dResult = 17000000 + 9000000

mov eax, 17000000
add eax, 9000000
mov [dResult], eax

; -----
;Quadword example
;qResult = 170000000 + 90000000

mov rax, 17000000000
add rax, 900000000
mov [qResult], rax

; *************************
;fin, terminate program.
ret





