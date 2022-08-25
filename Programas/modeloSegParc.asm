;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modeloSegParc.o modeloSegParc.asm -l modeloSegParc.lst
;link:	   -->> gcc -o modeloSegParc modeloSegParc.o
;run:      -->> modeloSegParc
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modeloSegParc.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
m1 db "Ingrese el valor de a ",0
m2 db "Ingrese el valor de b ",0
m3 db "Ingrese el valor de c ",0
m4 db "El resultado x= %ld ",0
fmt db "%ld",0		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resd 1         
b resd 1
c resd 1
x resd 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
; Escanear las variables por teclado

sub rsp,0x20
mov rcx,m1
call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmt
	mov rdx,a
	call scanf
add rsp,0x20

sub rsp,0x20
	mov rcx,m2
	call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmt
	mov rdx,b
	call scanf
add rsp,0x20

sub rsp,0x20
mov rcx,m3
call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmt
	mov rdx,c
	call scanf
add rsp,0x20

sub rsp,0x20
	mov ecx,dword[a]
	mov edx,dword[b]
	mov r8d,dword[c]
	call calcular
add rsp,0x20

mov [x],eax

sub rsp,0x20
	mov rcx,m4
	mov edx,dword[x]  
	call printf
add rsp,0x20

ret
;---------------------------------------
;..........subrutinas....................	

calcular:
;mov ecx,dword[a]
;mov edx,dword[b]
;mov r8d,dword[c]
;shadow space

mov [rsp+8],rcx ;a
mov [rsp+16],rdx;b
mov [rsp+24],r8;c

;1) -b 

neg edx
;2) a>>5
sar ecx,5
;3 c -b
sub r8d,[rsp+16]

;4) b& 0xabcdef
mov ebx,[rsp+16]
and ebx,0xABCDEF

;5) 1)*80

IMUL edx,80
;6 2)- 20
sub ecx,20

;7) 3) xor 4)
xor r8d,ebx

;8)  6) / 7)
mov r9d,edx
mov eax,ecx
cdq

IDIV r8d
; eax = cociente
; edx = residuo
;9)  5)  or 8)
or r9d,eax

mov eax,r9d
ret 

