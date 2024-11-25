.data
    Hello: .asciiz "hello world. this sentence is in uppercase!\n" # null terminated string

.text
    la $t0, Hello
    j convert_uppercase

    # Method to convert a string stored in the address at $t0 to uppercase assuming it is null terminated
    convert_uppercase:
        lbu $t1, 0($t0)
        beq $t1, $zero, print_string # Once we reach null terminator print string
        li $t2, 97 # store char 'a'
        blt $t1, $t2, increment # immediately go to next if it is
        li $t2, 122 # store char 'z'
        bgt $t1, $t2, increment  
        addiu $t1, $t1, -32
        sb $t1, 0($t0)

    increment:
        addi $t0, $t0, 1
        j convert_uppercase

    print_string:
        la $a0 Hello
        li $v0 4
        syscall # Print to screen
        li $v0 10
        syscall # Exit
