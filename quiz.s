LC:
    .ascii "Please enter the y number %d\0"
LCP:
    .ascii "%d \0"
LCC:
    .ascii "y number plus 1 is %d\0"
LC0:
    .ascii "Please enter the x and n numbers"
LC1:
    .ascii "%d %d\0"
LC2:
    .ascii "The shift of the x number with n shift %d \12\0"

    .globl _main
    .def   _main;   .scl   2;   .type   32; .endef

_main:
    pushl %ebp
    movl %esp, %ebp

    subl $32, %esp

    movl $LC0, (%esp)
    call _puts

    leal 12(%esp), %eax
    movl %eax, 8(%esp)

    leal 16(%esp), %eax
    movl %eax, 4(%esp)

    movl $LC1, (%esp)
    call _scanf

    movl 16(%esp), %eax
    sall $4, %eax
    movl 12(%esp), %ecx
    shrl %cl, %eax

    movl %eax, 4(%esp)
    movl $LC2, (%esp)
    call _printf


    movl $LC, (%esp)
    call _puts
    leal 24(%esp), %eax
    movl %eax, 12(%esp) 

    movl $LCP, (%esp)
    call _scanf

    movl 24(%esp), %edx
    incl %edx

    movl %edx, %eax
    movl $LCC, (%esp)
    call _printf

    andl $32, %esp
    leave
    ret
