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

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
cadena		DB "Hola Mundo", 0
caracter 	DB "A"
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 				
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones


ret
;----------------------------------------
;aqui se escriben las subrutinas (funciones)
;..........subrutinas....................	

ret