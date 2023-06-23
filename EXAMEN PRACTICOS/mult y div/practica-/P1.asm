;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link: -->> gcc -o P1 P1.o
;run: -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (examen practico -- cs - 32 bits )
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

 xor rax , rax           
 xor rbx , rbx 
 xor rcx , rcx

mov rax , [registro]     ;rax = registro 
and rax , 0x11223344	; rax = (registro & 0x11223344)  ---

mov rbx , [carnet] 
sar rbx , 1				; rbx  = (carnet >> 1)

or rbx , 0x44332211		; rbx = ((carnet >> 1) | 0x44332211)------
mov rcx , rbx 
add rbx ,rcx 

xor rax ,rbx 
mov [x], rax 


ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret