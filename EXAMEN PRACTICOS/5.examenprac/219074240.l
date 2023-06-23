     1                                  ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     2                                  ;assemble and link with:
     3                                  ;assemble: -->> nasm -f win64 -o 219074240.o 219074240.asm -l 219074240.lst
     4                                  ;link: -->> gcc -o 219074240 219074240.o
     5                                  ;run: -->> 219074240
     6                                  ;debugger: -->> x64dbg 219074240
     7                                  ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     8                                  ;-----------------------------------------
     9                                  
    10                                  ;file: 219074240.asm (nombre programa)
    11                                  ;registro:
    12                                  ;nombres y apellidos:
    13                                  
    14                                  
    15                                  extern printf, scanf
    16                                  
    17                                  segment .data
    18                                  ;aqui se declaran variables inicializadas
    19 00000000 3FA39400                a DD 9741119
    20 00000004 A0AF9B00                b DD 10203040
    21 00000008 C0CE0E0D                c DD 219074240
    22 0000000C FECAFECA                d DD 0xCAFECAFE
    23 00000010 001F0AFA                e DD -100000000		
    24                                  
    25                                  segment .bss
    26                                  ;Block Started by Symbol(BSS)
    27                                  ;aqui van las variables declaradas pero sin inicializar
    28                                  
    29 00000000 ????????                x resd 1 
    30                                  segment .text
    31                                  global main
    32                                  main:
    33                                  ;etiqueta que indica el comienzo del programa principal
    34                                  ;aqui van las instrucciones
    35                                  ;...
    36                                  ;.......................................................................
    37                                  ;x = (a | b) - c ^ d;
    38 00000000 4831C0                  xor rax , rax 		; limpio registro
    39 00000003 8B0425[00000000]        mov eax ,[a] 		; eax = a 
    40 0000000A 0B0425[04000000]        or eax , [b]		; eax =( a|b)
    41 00000011 2B0425[08000000]        sub eax , [c]		; eax = (a|b)- comienzo
    42 00000018 330425[0C000000]        xor eax , [d]		;eax = (a|b)- c ^ d 
    43 0000001F 890425[00000000]        mov [x] ,eax 			; x= (a|b)- c ^ d 
    44                                  ;x = (x >> 2) & (e << 4);
    45 00000026 C13C25[00000000]02      SAR dword[x] , 2	; x = x>>2
    46 0000002E 8B0425[00000000]        mov eax , [x] 		;eax = x>>2
    47 00000035 C12425[10000000]04      SAL dword[e],4 		; e = e<<4
    48 0000003D 230425[10000000]        and eax , [e]        ; eax = (x >> 2) & (e << 4)
    49 00000044 890425[00000000]        mov [x] , eax 		;x =(x >> 2) & (e << 4)
    50 0000004B C3                      ret
    51                                  
    52                                  
    53                                  ;--------------------------------------
    54                                  ;============ subrutina ===============
    55                                  ;--------------------------------------
    56                                  ;aqui instrucciones subrutina (funcion)
    57                                  ;...
    58                                  ;...
    59 0000004C C3                      ret
