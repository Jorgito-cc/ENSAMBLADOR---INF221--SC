;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link: -->> gcc -o P1 P1.o
;run: -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)
;registro:
;nombres y apellidos:


extern printf, scanf, gets , strlen

segment .data
msj db "ingrese un valor",0
fmt db "%lld",0
fm1 db "su numerio es %lld",0
segment .bss
num resq 1

segment .text
global main
main:
sub rsp ,0x20

	mov rcx , msj   ;se manda la direccion 
	call printf		; printf("ingreese el valor ç")
	
	mov rcx ,fmt 
	mov rdx ,num  ; tiene que ser por referencia 
	call scanf      ;scanf(formato , variable)  %s - para cadena %ld valor numerico  %ldd entero de 64 bitws
	mov rcx  , fm1 
	mov rdx,[num]
	call printf		;printf("su numerio es %lld",num )
	
	
add rsp ,0x20 

ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)




ret