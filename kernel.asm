org 0x8200

section kernel_code


;输出'k'
mov byte [gs:160],'k'
mov byte [gs:161],0xa6

finish:
hlt
jmp finish

