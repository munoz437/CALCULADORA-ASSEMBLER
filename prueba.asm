.model small
.stack
.data 
    msg db "Hola UMG", "$"
.code

main proc
    mov ax,seg @data
    mov ds, ax
    
    mov ah,09
    lea dx, msg
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main