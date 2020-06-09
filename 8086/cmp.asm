.model small
.data
m1 db 10,13,"enter the string 1 $"
m2 db 10,13,"enter the string 2 $"
m3 db 10,13,"the lenght of string one is $"
m4 db 10,13,"the length of string 2 is $"
m5 db 10,13,"the strings are equal $"
m6 db 10,13,"the strings are not equal $"
buff1 db 100
l1 db ?
str1 db 100 dup(?)
buff2 db 100
l2 db ?
str2 db 100 dup(?)
.code
mov ax,@data
mov ds,ax
mov es,ax
lea dx,m1
call printf
lea dx,buff1
mov ah,0ah
int 21h
lea dx,m2
call printf
lea dx,buff2 
mov ah,0ah
int 21h

lea dx,m3
call printf

mov dl,l1
add dl,30h
mov ah,02h
int 21h
lea dx,m4
call printf
mov dl,l2
add dl,30h
mov ah,02h
int 21h

mov al,l1
mov bl,l2
cmp al,bl
jnz l3

lea si,str1
lea di,str2
mov cl,l1
mov ch,00h
cld
repe cmpsb

jnz l3
lea dx,m5 
call printf
jmp exit

l3:lea dx,m6
call printf 
exit:mov ah,4ch
int 21h

printf proc near
mov ah,09h
int 21h
ret
printf endp
end
