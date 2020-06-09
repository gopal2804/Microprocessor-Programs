.model small
.data
m1 db 10,13,"enter the string $"
m2 db 10,13,"the reverse of the string is $"
m3 db 10,13,"the string is palindrome $"
m4 db 10,13,"the string is not palindrome $"
buff db 100
len db ?
str db 100 dup(?)
rstr db 100 dup(?)
.code
mov ax,@data
mov ds,ax
mov es,ax
lea dx,m1
mov ah,09h
int 21h
lea dx,buff
mov ah,0ah
int 21h
lea si,str
lea di,rstr
mov cl,len
mov ch,00h
add si,cx
dec si
l1:mov al,[si]
mov [di],al
inc di
dec si
loop l1
lea dx,m2
mov ah,09h
int 21h

lea dx,rstr
mov ah,09h
int 21h


lea si,str
lea di,rstr
mov cl,len
mov ch,00h
cld
repe cmpsb
jz l2
lea dx,m4 
mov ah,09h
int 21h
jmp exit
l2:lea dx,m3
mov ah,09h
int 21h
exit:
mov ah,4ch
int 21h
end