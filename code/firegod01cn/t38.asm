;八进制未写，只显示二进制和空格，省点精力干别的 有兴趣自己写吧 我的天！
assume cs:code,ds:data,ss:stack 

stack segment
    db 100 dup(0)
stack ends 

data segment
    val dw 100h
data ends

code segment
    start:
    mov ax,data
    mov ds,ax
    mov es,ax
    mov ax,stack
    mov ss,ax
    call bando
    quit:
    mov ah,4ch
    int 21h 
   

bando proc near
    push ax
    push si
    push di
    mov si,0
    mov di,0
    mov ax,ds[si]
    mov ss[si],ax;进入堆栈 
    call paris
    pop di
    pop si
    pop ax
    ret
bando endp

paris proc near
    push ax
    push si
    push di
    mov si,0
    mov ax,ss[si]
    call outbin
    call outspace 
    pop di
    pop si
    pop ax
    ret
paris endp

outbin proc near
    push ax
    push bx
    push cx
    push dx        
    push si
    push di
    mov cx,0
    let1:
    mov bx,ss[si]
    shl bx,cl
    and bx,8000h
    shr bx,15 
    add bx,30h
    mov dl,bl
    mov ah,02h
    int 21h
    inc cl
    cmp cl,16
    jnz jmp let1
    outquit:
    pop di
    pop si
    pop dx
    pop cx        
    pop bx
    pop ax
    ret
outbin endp  

outspace proc near
    mov dl,'!'
    mov cx,8
    mov ah,02h
    let2:    
    int 21h
    loop let2
    ret 
outspace endp    

outoct proc near
outoct endp    
code ends
end start