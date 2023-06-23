;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o 219074240.o 219074240.asm -l 219074240.lst
;link: -->> gcc -o 219074240 219074240.o
;run: -->> 219074240
;debugger: -->> x64dbg 219074240
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 219074240.asm (examen practico )
;registro:
;nombres y apellidos:

extern printf, scanf
segment .data
;aqui se declaran variables inicializadas
a 	DD	219074240
b 	DD	-20
c   DD  12345467

segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar
x resd 1
segment .text
global main
main:
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;---------------------------
;x=(40-a)-(-b)
mov eax , 40		;eax = 40
sub eax ,[a]		;eax = (40-a)
neg dword[b]		;b= (-b )
sub eax ,[b]		;eax = (40-a)-(-b)
mov [x],eax 		;x= eax
;------------------------------------------------
;x--
;sub dword[x],1	;x=x--
;----------------------------------------------------
;x=(x+10)+(c+20)
add dword[x],10		;x=(x+10)
mov eax , [x]		;eax =x
add dword[c],20		;c=(c+20)
add eax , [c]		;eax = eax +c
mov [x],eax			;x=eax
;---------------------------------------
;x++
inc dword[x] 		;x++
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret

