;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o P2.o P2.asm -l P2.lst
;link: -->> gcc -o P2 P2.o
;run: -->> P2
;debugger: -->> x64dbg P2
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P2.asm (version 2  )
;registro:
;nombres y apellidos:

extern printf, scanf

segment .data
;aqui se declaran variables inicializadas

registro dq 219074240
carnet dq 9741119
segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar
x resq 1 

segment .text
global main
main:
; el divisor no tiene que ser cero 
;
;x = (registro & 0x11223344) ^ ((carnet >> 1) | 0x44332211)*2

;almacenando el resultado en memoria en la variable: x

;No está permitido el uso de las instrucciones de multiplicación: MUL o IMUL.

MOV RAX,[registro]
		MOV RBX,[carnet]
		XOR RCX,RCX
		MOV RCX,3
		
		AND RAX,0X11223344		;(registro & 0x11223344)
		SAR RBX,1				;(carnet >>1) 
		OR  RBX,0X44332211	;((carnet >>1) | 0x44332211)
		
		DEC RCX		;3-1 = 2
		MOV R8,RBX
		
	L1:	ADD RBX,R8		; EJ = 2+2
	
		LOOP L1			; DEC 1-1= 0 JNZ
		
		XOR RAX,RBX		 ;(registro & 0x11223344)^((carnet >>1) | 0x44332211)*2
		
		
		MOV [x],RAX

ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret