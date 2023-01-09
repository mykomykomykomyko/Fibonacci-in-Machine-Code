#define max_constant 20

mov ah, 0       
mov bx, 1       
mov cx, 1

print_number:
  push bx        
  call print_int
  pop bx
  inc ah         
  cmp ah, max_constant  
  jg end_loop
  add bx, cx     
  mov cx, bx     
  jmp print_number

end_loop:
  ret

print_int:
  pusha          
  mov ah, 0x0E   
  mov al, bl     
  add al, 48     
  int 0x10       
  popa           
  ret
