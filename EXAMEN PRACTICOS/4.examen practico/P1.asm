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


extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a DB -87
b DB -75
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 
global main 				
main:
xor rbx , rbx 	; limpieza del registro 	
 mov BH , -16	; BH = -16 
 dec BH  
 sub[a] , bh 	; [a] = 0xBA     CF=1 | ZF =0 | SF =1 | OF =0
 JC LL1 
 Or BH ,[b]
 JMP LL2
LL1: AND BH,[a] 
LL2: 
ret
 ; B ) BH = 0XAA

;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret


