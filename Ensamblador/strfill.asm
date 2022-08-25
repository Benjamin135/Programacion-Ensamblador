
segment .data

	cadena	db  "abcde", 0

segment .bss



segment .text
global main
main:

	mov rcx, cadena
	mov dl, 'a'
	call strfill

ret

;---------------------------------------------------------------------------
;............Subrutinas............
;---------------------------------------------------------------------------

strfill:
			push rcx		; preserva rcx porque cambia
	
whileNot0: 	cmp byte[rcx], 0
			je endOfStr
			mov [rcx], dl
			inc rcx
			jmp whileNot0
endOfStr: 	pop rcx
			ret




