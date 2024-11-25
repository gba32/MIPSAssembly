.data
    Hello: .asciiz "Hello World" # null terminated string

.text
    la $a0, Hello
    li $v0, 4 # print_string($a0)
    syscall

    li $v0, 10 # exit()
    syscall

