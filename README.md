# Machine-Fibonacci
The project of when I tried to study the machine code and try to write a rudimental program there.

# How does it work?
This program first *defines a constant that specifies the maximum number in the Fibonacci sequence* to be printed. It then initializes a loop counter in the **ah** register and the first two numbers in the sequence (1 and 1) in the **bx** and **cx** registers, resp. The loop begins with the label and prints the current number by pushing it onto the stack, calling the **print_int** function, and then popping it from the stack. The loop counter is then incremented, and the loop checks if it has reached the maximum number. If it has, the loop ends; otherwise, it calculates the next number in the sequence by adding bx and cx, updates the first two numbers in the sequence, and jumps back to the beginning of the loop.

```
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
```

**The print_int function is a helper function that converts the least significant byte of the number in the bx register to ASCII and prints it to the screen using a BIOS interrupt.**
