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

global main
extern printf, scanf

segment .data
registro dd P1
edad dd 22  
arreglo dd 2,1,9,0,7,4,2,4,0,2,2

segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar

suma resd 1 
segment .text
main:
xor rax , rax 
xor rbx , rbx			; acumulador  
xor rcx , rcx 
xor rsi , rsi 

mov rax , arreglo		; dirreccion inicial del arreglo
mov rcx , 11 			; contador del ciclo 

	add rbx , [rax + 4]	; metodo indirecto por registro
	nop 
	add rbx , [rax +12]
	nop 
	add rbx ,  [rax + 28]
	nop 
	add rbx , [rax +40]
	nop 
	mov [suma] , rbx 
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret