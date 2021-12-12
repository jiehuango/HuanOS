org 0x7c00
section boot
hello db 'hello'
error_msg db 'error'

mov ax,cs
mov ds,ax
mov es,ax
mov ss,ax
mov fs,ax
mov sp,0x7c00
mov ax,0xb800
mov gs,ax
;输出hello

mov bh,0
mov bl,0x01
mov cx,0x5
mov dx,0

mov ax,hello
mov bp,ax
mov ah,0x13
mov al,0x01

int 0x10

;读入loader

mov ch,0
mov cl,2
mov dh,0
mov dl,0x00
mov ax,0x800
mov es,ax

mov al,0x1
mov ah,0x2
int 0x13
jnc finish

error:
mov bh,0
mov bl,0x01
mov cx,0x5
mov dx,0

mov ax,error
mov bp,ax
mov ah,0x13
mov al,0x01

int 0x10


finish:
jmp 0x8000

times 510-($-$$) db 0
db 0x55,0xaa
