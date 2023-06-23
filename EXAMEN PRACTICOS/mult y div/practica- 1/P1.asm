;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link: -->> gcc -o P1 P1.o
;run: -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (examen de programacion mul y div y basic )
;registro:
;nombres y apellidos:

global main
extern printf, scanf

segment .data
a dd -35501
b dd 219074240
c dd -70503
d dd 9741119


segment .bss
x resd 1

segment .text
main:


xor rax , rax 
xor rbx , rbx 
xor rcx , rcx 
xor rsi , rsi 

; x = ((-b) * 85) I ((a>>5 )-19)
	mov ebx , [b]   
	neg ebx 
	;imul eax ,ebx ,85
	imul ebx , 85
	
	
	sar dword[a] , 5
	mov eax , [a]
	sub eax , 19
	
	mov ecx , [c] 
	mov edx ,[d]
	sub ecx , edx 
	
	mov edx ,[d]
	and edx , 0xF3A5BE2F
	XOR ECX , edx 
	
	cmp ecx,0
	jne dividir  ; je
	jmp fin 
	
	dividir : 
	cdq 
	idiv ecx 
	or ebx ,eax 
	mov [x] , ebx 
	fin :



ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret