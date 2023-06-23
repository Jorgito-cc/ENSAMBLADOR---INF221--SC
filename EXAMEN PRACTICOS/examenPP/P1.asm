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
a dd 1;-35501      ;registro
b dd 2;219074240
c dd 3;70503   ; carnet 


segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar
x resd 1 

segment .text
global main
main:
; el divisor no tiene que ser cero 

;x = ((-30)*(-a)- (b >> 3) ) ^ (~c | (a&b) / ((-b) % c))
XOR rax , rax 
xor rbx , rbx
xor rcx , rcx 
xor rdx , rdx 
xor rsi , rsi 

mov ebx , -30 
mov ecx , [a] 
neg ecx 			; ecx = (-a)
imul ebx , ecx 		; ebx = (-30)*(-a)   |

mov esi , [b] 
SAR esi , 3 		; esi = (b >> 3)

sub ebx , esi 		; ebx = ((-30)*(-a)- (b >> 3) ) ----------------------

mov r8d , [c] 
neg r8d				; r8d = ~c
;----
mov ecx , [a]
mov r11d , [b]
and ecx , r11d		; ecx = (a&b) ------------
;-------------------------------
;x = ((-30)*(-a)- (b >> 3) ) ^ (~c | (a&b) / ((-b) % c))
;--------------------------
mov eax  , [b] 		; eax  =  b
neg eax 			; eax = -b 
mov r9d , [c]		; r9d =  c 
cdq 
idiv r9d          
; eax = esta el codiente 
; edx = esta el residuo o % 
mov r10d , edx     ; r10d  = esta el residuo
 
mov eax , ecx      ; eax = (a&b)

cdq 
idiv r10d     

or r8d , eax 		; r8d = (~c | (a&b) / ((-b) % c)

xor ebx , r8d      ; ebx = ((-30)*(-a)- (b >> 3) ) ^ (~c | (a&b) / ((-b) % c))

mov [x] , ebx       ; x = ((-30)*(-a)- (b >> 3) ) ^ (~c | (a&b) / ((-b) % c))
ret

;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret