.model small 
.stack 100h
.data
.code  

main proc 
    mov ax, @data
    mov ds, ax 
    
    
    mov ax, 8     
    mov dx ,1
    add dx, ax
              
    ;add dx, '0' 
    ;add dx, 48
     add dx, 30h
                
    mov ah, 2h   ; charachter print            
    int 21h
    
    ;asciiii covert
    
    
    exit:
    mov ah, 4ch
    int 21h
    
    
    main endp
end main 
    
