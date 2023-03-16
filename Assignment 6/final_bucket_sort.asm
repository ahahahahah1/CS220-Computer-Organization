.data
nl : .asciiz "\n"
arr: .float 0.123, 0.2735, 0.172, 0.3532, 0.1425, 0.5456, 0.214, 0.972
temp: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
indices: .word 0:10
bucket: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
size: .word 10
ten: .float 10.0
insideTemp: .asciiz "inside temp"
insideBucket: .asciiz "inside bucket"
insideSort: .asciiz "inside sort"
insidePrint: .asciiz "inside print"
.text

main:
    la $s0, arr
    la $s1, temp
    la $s2, indices
    lwc1 $f10, ten

    li $t0, 0 # counter
    li $t1, 0 # counter under array

temp_maker:

    lwc1 $f0, arr($t0)

    mov.s $f2, $f0 
    mul.s $f0, $f0, $f10

    trunc.w.s $f0, $f0
    mfc1 $t2, $f0

    move $t3, $t2 # to change index
    mul $t2, $t2, 40 # to change temp

    add $t2, $t2, $s1
    mul $t3, $t3, 4 # going to index 
    add $t3, $t3, $s2
    lw $t4, 0($t3)
    add $t4, $t4, 1
    sw $t4, 0($t3) # incrementing index
    addi $t4, $t4, -1
    sll $t4, $t4, 2
    add $t4, $t4, $t2
    swc1 $f2, 0($t4) # storing in temp

    addi $t1, $t1, 1
    addi $t0, $t0, 4
    bne $t1, 8, temp_maker

    li $t0, 0 # counter
    bucket_travel:

        mul $t1, $t0, 40
        add $t1, $t1, $s1
        move $a1, $t1
        mul $t2, $t0, 4
        add $t2, $t2, $s2
        move $a2, $t2


        insertionsort:
            move $s6, $a1
            lw $s7, 0($a2)

            li $t3, 1 # i = 1
            loop:
                bge $t3, $s7, end
                mul $t4, $t3, 4
                add $t4, $t4, $s6 # $t1 is key addres

                addi $t5, $t3, -1 # j = i - 1
                lwc1 $f1, 0($t4) # $f1 is key
                loop2:
                    blt $t5, 0, exit 
                    mul $t6, $t5, 4
                    add $t6, $t6, $s6 # $t3 is j address
                    lwc1 $f0, 0($t6) # $f0 is arr[j]

                    c.le.s $f0, $f1
                    bc1t exit
                    addi $t7, $t6, 4
                    swc1 $f0, 0($t7) # arr[j + 1] = arr[j]
                    addi $t5, $t5, -1 # j = j - 1
                    j loop2
                exit:
                    addi $s3, $t5, 1
                    mul $s3, $s3, 4
                    add $s3, $s3, $s6 # $t5 is j + 1 address
                    swc1 $f1, 0($s3) # arr[j + 1] = key
                    addi $t3, $t3, 1 # i = i + 1
                    j loop
            end:

        addi $t0, $t0, 1
        bne $t0, 10, bucket_travel

    jal print_array

    li $v0, 10
    syscall





print_array:
    li $t0, 0
    li $t1, 0
    print_loop:
        lwc1 $f0, temp($t0)
        c.eq.s $f0, $f4
        bc1t skip
        mov.d $f12, $f0
        li $v0, 2
        syscall
        la $a0, nl
        li $v0, 4
        syscall
        skip:
            addi $t0, $t0, 4
            addi $t1, $t1, 1
            bne $t1, 100, print_loop
    jr $ra