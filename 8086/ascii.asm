.model small
.data
m1 db 10,13,"Enter character$"
m2 db 10,13, "The ascii value is:$"
n db ?
.code
mov ax,@data
mov ds, ax

mov ah, 06h
mov cx, 0000h
mov bh, 063h
mov dh, 24d
mov dl, 79d
int 10h

lea dx, m1
mov ah, 09h
int 21h
mov ah, 01h
int 21h
mov n, al
 
mov bl,0ah
mov bh, 00h
mov cx, 00h
mov ah, 00h

l1:mov dx, 00h
div bx
push dx
inc cx
cmp ax, 00h
jnz l1

lea dx, m2
mov ah, 09h
int 21h
mov ah, 2
mov bh, 0
mov dh, 12
mov dl, 39
int 10h

l2:pop dx
add dl, 30h
mov ah,02h
int 21h
loop l2
 
mov ah, 4ch
int 21h
end