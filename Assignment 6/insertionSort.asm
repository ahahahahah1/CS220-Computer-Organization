.data
arr: .float 0.123, 0.2735, 0.372, 0.1532, 0.1425, 0.2456, 0.314, 0.572
bucket: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
size: .word 8


.text
.globl main

main:
    la $a0, arr
    la $a1, size
    
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    ; jal insertionSort
    jal printArray

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    li $v0, 10
    syscall

; insertionSort:
;     addi $sp, $sp, -12
;     sw $ra, 8($sp)
;     sw $a0, 4($sp)
;     sw $a1, 0($sp)

;     li $t1, 1
;     move $t2, $a1

;     outerLoop:
;         slt $t0, $t1, $t2
;         beq $t0, $zero, outerLoopExit
;         sll $t3, $t1, 2
;         add $t3, $t3, $a0
;         lwc1 $f0, 0($t3)                # key = arr[i]

;         addi $t4, $t1, -1               # j = i - 1

;         innerLoop:
;             slt $t5, $t4, $zero             # j < 0 : if true $t5 is 1
;             bne $t5, $zero, innerLoopExit
        
;             sll $t6, $t4, 2
;             add $t6, $t6, $a0
;             lwc1 $f1, 0($t6)                 # $f1 = arr[j]
;             c.le.s $f1, $f0
;             bc1t innerLoopExit

;             addi $t7, $t6, 4
;             lw $t7, 0($t6)
;             addi $t4, $t4, -1

;             j innerLoop
    
;         innerLoopExit:
;             addi $t7, $t6, 4
;             s.s $f0, 0($t7)
;             j outerLoop

;     outerLoopExit:
;         lw $ra, 8($sp)
;         lw $a0, 4($sp)
;         lw $a1, 0($sp)
    
;     jr $ra

printarray:
    li $t0, 1 #counter for loop
    loop:
        lwc1 $f12, 0($a0)
        li $v0, 2
        syscall
        addi $a0, $a0, 4
        addi $t0, $t0, 1
        bne $t0, 8, loop
        li $v0, 10
        syscall