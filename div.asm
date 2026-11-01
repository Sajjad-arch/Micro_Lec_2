;ah = 9h(str), ah= 1h(user input), ah = 2h(output), ah = 4ch(exit)
    
    
   
.model small 
.stack 100h
.data 

divdend db "Enter Dividend : $ "
divisor db 13,10, "Enter divisior : $ "
quotient db 13,10, "your quotient : $ "  
remainder db 13,10, "Enter Remainder ; $ "
error db 13,10, "Undefine!!! $ "

.code  

main proc 
    mov ax, @data
    mov ds, ax 
                  
    ;str print   
    
    lea dx, divdend  ;str print
    mov ah, 9h ;str print
    int 21h   ;interrupt    
    
    
    ;dividend user input
    mov ah,1  ;user input
    int 21h 
    
    ;al = by default user input
    
    sub al, 30h  ;decimal convertt
    mov bl, al   ;bl = dividend
                                 
                                 
    lea dx, divisor  ;str print
    mov ah, 9h ;str print
    int 21h   ;interrup 
          
          
         ;divisior
        mov ah,1  ;user input
    int 21h 
    
    ;al = by default user input
    
    sub al, 30h  ;decimal convertt
    mov bh, al   ;bh = divisor
    
    
    ;corner case
    cmp bh, 0
    je undefine  ;jump if equal
         
         ;quotient
        lea dx, quotient  ;str print
    mov ah, 9h ;str print
    int 21h   ;interrup 
          
             ;else
      mov al, bl ;quotient store  
      xor ah, ah  ; ah= remainder  = memory clear
      div bh
      mov dl, al  
      
      add dl, '0'   ;ascii convert
      mov ah, 2h
      int 21h
      
      jmp exit  
       undefine:
        lea dx, error  ;str print
        mov ah, 9h ;str print
        int 21h   ;interrup      
        
           
                                
                  
                  
    ;asciiiii, pattern = mindddd
    ;case insensitivee , indentation not mind

    
    
    exit:
    mov ah, 4ch
    int 21h
    
    
    main endp
end main 
    




