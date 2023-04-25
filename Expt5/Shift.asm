section .data

  men db 10,13,"    MENU     "
    db 10,13," 1.Successive addition"
    db 10,13," 2.Add and Shift method"
    db 10,13," 3.Exit"
    db 10,13," Enter your choice "
  menlen equ $-men
  
  msg1 db 10,13," Enter a 4 digit number "
  msg1len equ $-msg1
  
  msg2 db 10,13," The product is  "
  msg2len equ $-msg2
  
  newline db 10,13,""
  
  err db 10,13," Invalid input "
  errlen equ $-err
  
  endmsg db 10,13," Thankyou "
  endmsglen equ $-endmsg
  
section .bss
  n resb 5
  res resb 6
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
         menu: print men,menlen
               read cho,2
               cmp byte[cho],'1'
               je successive_addition
               cmp byte[cho],'2'
               je add_shift
               cmp byte[cho],'3'
               je finish
               
               print err,errlen
               jmp menu 
               
    successive_addition: xor eax,eax
                         xor ebx,ebx
                         xor ecx,ecx
                         xor edx,edx
                         
                         print msg1,msg1len      
                         read n,5
                         call convert
                         push ebx
                         
                         print msg1,msg1len
                         read n,5
                         call convert
                         
                         mov cx,bx
                         pop ebx
                         
                         xor eax,eax
                         
                 repet:  add ax,bx
                         loop repet
                         
                         mov bx,ax
                         push ebx
                         print msg2,msg2len
                         pop ebx
                         call display
                         
                         print newline,1
                         
                         jmp menu    
                         
               add_shift: xor eax,eax
                         xor ebx,ebx
                         xor ecx,ecx
                         xor edx,edx
                         
                         print msg1,msg1len      
                         read n,5
                         call convert
                         mov[n1],bl
                         mov[n1+1],bh
                         
                         print msg1,msg1len
                         read n,5
                         call convert
                         mov[n],bl
                         mov[n+1],bh
                         
                        
                         xor ebx,ebx
                         xor ecx,ecx
                         xor edx,edx 
                         xor eax,eax
                         
                         mov dl,16
                         mov al,[n1]
                         mov bl,[n]                 
                       
               UP1:      shr bx,01
                         jnc L
                         add cx,ax
                      
                L:       shl ax,01
                         dec dl
                         jnz UP1
                         
                         mov ebx,ecx
                         push ebx
                         print msg2,msg2len
                         pop ebx
                         call display
                         
                         print newline,1
                         jmp menu
                         
                 finish: print endmsg,endmsglen
                         print newline,1
                         
                         mov eax,1
                         mov ebx,0
                         int 80h
                         
                 display:mov ecx,8
                         mov edi,res
                        
                back1: rol bx,4
                       mov al,bl
                       and al,0fh
                       cmp al,09h
                       jbe X
                       add al,07h
                       
               X: add al,30h
                  mov[edi],al
                  inc edi
                  loop back1
                  print res,4
                  
             ret
             
            convert: mov ecx,04
                     mov esi,n
                up1:
                    rol bl,04
                    mov al,[esi]
                    cmp al,39h
                    jbe p1
                    sub al,07h
                
                p1: sub al,30h
                    add bl,al
                    inc esi
                    loop up1
                    
             ret                                      
                         
                                        
                    
    

