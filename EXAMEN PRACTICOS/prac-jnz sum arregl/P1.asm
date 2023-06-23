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
;nombres y apellidos: jorge choque calle 


extern printf, scanf

segment .data
;aqui se declaran variables inicializadas
a DB 10 ,20 ,30,40,50

segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar
suma resb 1

segment .text
global main 
main:
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;...
;...
mov ecx , 5 
xor al,al 
mov rbx , a
ciclo :   add al ,[rbx] 
				inc rbx
				dec ecx
				jnz ciclo 
		mov [suma],al 
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret