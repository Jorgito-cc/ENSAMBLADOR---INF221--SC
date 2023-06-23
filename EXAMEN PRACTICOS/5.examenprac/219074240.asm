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
a DD 1234567
b DD 10203040
c DD 219074240
d DD 0xCAFECAFE
e DD -100000000		

segment .bss
;Block Started by Symbol(BSS)
;aqui van las variables declaradas pero sin inicializar

x resd 1 
segment .text
global main
main:
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;...
;.......................................................................
;x = (a | b) - c ^ d;
xor rax , rax 		; limpio registro
mov eax ,[a] 		; eax = a 
or eax , [b]		; eax =( a|b)
sub eax , [c]		; eax = (a|b)- comienzo
xor eax , [d]		;eax = (a|b)- c ^ d 
mov [x] ,eax 			; x= (a|b)- c ^ d 
;x = (x >> 2) & (e << 4);
SAR dword[x] , 2	; x = x>>2
mov eax , [x] 		;eax = x>>2
SAL dword[e],4 		; e = e<<4
and eax , [e]        ; eax = (x >> 2) & (e << 4)
mov [x] , eax 		;x =(x >> 2) & (e << 4)
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret