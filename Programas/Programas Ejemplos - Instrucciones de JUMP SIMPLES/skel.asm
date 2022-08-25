;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;.text=   0X004016E0
;.data=   0x00403000

extern printf, scanf		

segment .data

segment .rodata
		
segment .bss

segment .text 

global main 					
main:
;---------------------------------------	

ret
;---------------------------------------
;..........subrutina....................	




