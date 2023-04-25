EXPERIMENT 5:
INPUT:
section .data
       men db 10,13,"------------8-BIT MULTIPLICATION-----------"
       db 10,13,"ENTER 1.SUCCESSIVE ADDITION"
       db 10,13,"ENTER 2.ADD & SHIFT METHOD"
       db 10,13,"ENTER 3.EXIT"
       db 10,13,"ENTER YOUR CHOICE:"
       menlen equ $-men
       msg1 db 10,13,"ENTER A 2-DIGIT NUMBER:"
       msg1len equ $-msg1
 
       msg2 db 10,13,"THE PRODUCT IS:"
       msg2len equ $-msg2
 
       newline db 10,13,""
 
       err db 10,13,"INVALID INPUT..."
       errlen equ $-err
 
       endmsg db 10,13,"THANKYOU..."
       endmsglen  equ $-endmsg
 
section .bss
      n resb 3
      res resb 4
      n1 resb 1
      cho resb 2
 
%macro print 2
     mov eax,4
     mov ebx,1
     mov ecx,%1
     mov edx,%2
     int 80h
%endmacro
 
%macro read 2      
     mov eax,3
     mov ebx,0
     mov ecx,%1
     mov edx,%2
     int 80h
%endmacro
 
section .text
   global _start
   _start:
        menu:print men,menlen
             read cho,2
             cmp byte[cho],'1'
             je SUCCESSIVE_ADDITION
             cmp byte[cho],'2'
             je ADD_SHIFT
             cmp byte[cho],'3'
             je finish
 
             print err,errlen
             jmp menu
 
SUCCESSIVE_ADDITION:xor rax,rax
                    xor rbx,rbx
                    xor rcx,rcx
                    xor rdx,rdx
 
                    print msg1,msg1len
                    read n,3
                    call convert
                    push rbx
 
                    print msg1,msg1len
                    read n1,3
                    call convert
 
        	    mov cx,bx
        	    pop rbx
 
        	    xor rax,rax
 
repet:  add ax,bx
        loop repet
 
        mov bx,ax
        push rbx
        print msg2,msg2len
        pop rbx
        call display
 
        print newline,1
 
        jmp menu
 
 
ADD_SHIFT:xor rax,rax
	  xor rbx,rbx
          xor rcx,rcx
          xor rdx,rdx
 
          print msg1,msg1len
          read n,3
          call convert
          mov[n1],bl
 
          print msg1,msg1len
          read n,3
          call convert
          mov[n],bl
 
	  xor rbx,rbx
          xor rcx,rcx
          xor rdx,rdx
          xor rax,rax
 
          mov dl,08
          mov al,[n1]
          mov bl,[n]
 
UP1:shr bx,01
    jnc L
    add cx,ax
 
L:shl ax,01
  dec dl
  jnz UP1
 
  mov rbx,rcx
  push rbx
  print msg2,msg2len
  pop rbx
  call display
 
  print newline,1
  jmp menu
 
finish:print endmsg,endmsglen
       print newline,1
 
       mov eax,1
       mov ebx,0
       int 80h
 
display:mov rcx,4
        mov rdi,res
 
back1:rol bx,4
      mov al,bl
      and al,0fh
      cmp al,09h
      jbe X
      add al,07h
 
 
 
X:    add al,30h
      mov [rdi],al
      inc rdi
      loop back1
      print res,4
 
 
ret
 
convert:   mov rcx,02
           mov rsi,n
 
up1:rol bl,04
    mov al,[rsi]
    cmp al,39h
    jbe p1
    sub al,07h
 
p1:sub al,30h
   add bl,al
   inc rsi
   loop up1
ret
