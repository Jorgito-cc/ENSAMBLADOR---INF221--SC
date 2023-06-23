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
a dd 219074240      ;registro
b dd -82
c dd 9741119    ; carnet 

segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar
d resd 1 

segment .text
global main
main:
; el divisor no tiene que ser cero 
;d =((a<<3 ) & (-b*8)) / ((b-c) ^ 3 ) 
 xor rax , rax           
 xor rbx , rbx 
 xor rcx , rcx

mov eax , [a] 
sal eax , 3  	;eax =  (a<<3 ) 

mov ebx , [b] 	; ebx = b
neg ebx 		; ebx = -b 

imul ebx , 8    ; ebx =  (-b *8)

and eax , ebx 	; eax = ((a<<3 ) & (-b*8))

; ----------------------------------------
mov ecx , [b] 
sub ecx ,[c]  	;  ecx = (b-c ) 
or ecx , 3 		; ecx = ((b-c) ^ 3 )
cmp ecx , 0
je fin    ; si es igual a cero 
cdq 
idiv ecx 
mov [d] , eax 
fin :
; mov [d] , eax 
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret