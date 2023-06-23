
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o 219074240.o 219074240.asm -l 219074240.lst
;link: -->> gcc -o 219074240 219074240.o
;run: -->> 219074240
;debugger: -->> x64dbg 219074240
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 219074240.asm (nombre programa)
;registro:
;nombres y apellidos:
extern printf, scanf
segment .data
;aqui se declaran variables inicializadas
a  DD 1234567
b   DD -30
c   DD  219074240
segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar
x resd 1
segment .text
global main
main:
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;------------------------
; x= (155+a) - (b+25)
add dword[a] , 155		; a = ( a+155)
add dword[b] , 25 		; b= ( b+25)
mov eax , [a]			; eax = (a+155)
sub eax , [b] 			; eax = (a+155) - ( b+25)
mov [x], eax 		; x = eax
;----------------------------------
; x = (x-50)-(-c)
mov eax , [x]		; eax = x
sub eax , 50 		; eax = (x-50)
neg dword[c]		; c= (-c)
sub eax ,[c]		; eax = (x-50)-(-c)
mov [x], eax 		; x = eax
;---------------------------------
;x++
inc dword[x]   		; x=x++
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret