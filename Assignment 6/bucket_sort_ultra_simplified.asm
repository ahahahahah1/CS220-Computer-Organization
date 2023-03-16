.data
arr: .float 0.123, 0.2735, 0.372, 0.1532, 0.1425, 0.2456, 0.314, 0.572
bucket: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
temp: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
    .float 0.123, 0.1532, 0.1425, 0.0, 0.0, 0.0, 0.0, 0.0
    .float 0.2735, 0.2456, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
    .float 0.372, 0.314, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
    .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
    .float 0.572, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
indices: .word 0, 3, 2, 2, 0, 1
size: .word 8
which_index: .word 0

.text
.globl main

insertionSort:
		addi	$sp, $sp -12
		sw		$ra, 8($sp)
		sw		$s1, 4($sp)
		sw		$s0, 0($sp)
		
		addi	$s0, $zero, 0		
insertionLoop:
		slt		$t0, $s0, $a1
		beq		$t0, $zero, exitInsertion
		sll		$t1, $s0, 2
		add 	$t1, $t1, $a0
		lwc1	$f0, 0($t1)		# $f0(val) = arr[i]
		
		add		$s1, $s0, $zero
innerloop:
		blez	$s1, exitinner
		addi	$t1, $s1, -1
		sll		$t1, $s1, 2
		add		$t1, $t1, $a0
		lwc1	$f2, -4($t1)		
		c.le.s	$f2, $f0
		bc1f	exitinner		# exit innerloop if arr[j-1] <= val
		
		sll		$t1, $s1, 2
		add		$t1, $t1, $a0
		lwc1	$f2, -4($t1)
		swc1	$f2, 0($t1)
		addi	$s1, $s1, -1
		
		j 		innerloop

exitinner:
		sll		$t1, $s1, 2
		add		$t1, $t1, $a0	
		swc1	$f0, 0($t1)
		
		addi	$s0, $s0, 1
		
		j		insertionLoop

exitInsertion:
		lw		$ra, 8($sp)
		lw		$s1, 4($sp)
		lw		$s0, 0($sp)
		addi	$sp, $sp, 12

		jr		$ra





main:
    # Initialize variables
    li $t0, 1
    li $t1, 6
    li $t2, 0

    # Loop through each bucket and sort their contents using Insertion Sort
    ControlLoop:
        bge $t0, $t1, ControlLoopExit
        la $t3, temp
        lw $t4, indices
        sll $s0, $t0, 5
        add $s0, $s0, $t3
        move $a0, $s0
        sll $s1, $t0, 2
        add $s1, $s1, $t4
        move $a1, $t4
        jal insertionSort
        addi $t0, $t0, 1
        j ControlLoop
    ControlLoopExit:

    # Move the contents of each bucket to the main bucket
    li $t0, 0
    li $t1, 10
    li $t2, 0
    ConcatOuterLoop:
        bge $t0, $t1, ConcatOuterLoopExit
        sll $t6, $t0, 5
        la $s0, temp
        add $s0, $s0, $t6

        lw $s1, indices
        sll $t4, $t0, 2
        add $s1, $s1, $t4
        
        li $t5, 0
        ConcatInnerLoop:
            bge $t5, $s1, ConcatInnerLoopExit
            
            lwc1 $f0, 0($s0)
            s.s $f0, bucket($t2)
            addi $t2, $t2, 4
            addi $t3, $t3, 4
            addi $t5, $t5, 1
            j ConcatInnerLoop
        ConcatInnerLoopExit:
        addi $t0, $t0, 1
        j ConcatOuterLoop
    ConcatOuterLoopExit:

    # Print the sorted contents of the main bucket
    li $t0, 0
    li $t1, 8
    li $v0, 2
    PrintArrayLoop:
        bge $t0, $t1, next4
        lwc1 $f12, bucket($t0)
        syscall
        li $v0, 4
        la $a0, space
        syscall
        addi $t0, $t0, 4
        j PrintArrayLoop
    next4:

    li $v0, 10

; insertionSort:
;     addi $sp, $sp, -16       # allocate space for key, i, and j on the stack
;     sw $ra, 0($sp)           # save the return address
;     sw $a0, 4($sp)           # save the array pointer
;     sw $a1, 8($sp)           # save the array size

;     li $t0, 1                # initialize i = 1
; outer_loop:
;     bge $t0, $a1, end_sort   # if i >= n, exit the loop
;     lw $f12, ($a0, $t0, 4)   # load key = arr[i]
;     addi $t1, $t0, -1        # initialize j = i - 1
; inner_loop:
;     blt $t1, 0, end_inner    # if j < 0, exit the loop
;     lw $f14, ($a0, $t1, 4)   # load arr[j]
;     c.le.s $f14, $f12        # if arr[j] <= key, exit the loop
;     bc1t end_inner
;     swc1 $f14, ($a0, $t1, 4) # shift arr[j] to arr[j+1]
;     addi $t1, $t1, -1        # decrement j
;     j inner_loop
; end_inner:
;     swc1 $f12, ($a0, $t1, 4) # insert key in the correct position
;     addi $t0, $t0, 1         # increment i
;     j outer_loop
; end_sort:
;     lw $a1, 8($sp)           # restore the array size
;     lw $a0, 4($sp)           # restore the array pointer
;     lw $ra, 0($sp)           # restore the return address
;     addi $sp, $sp, 16        # deallocate the stack space
;     jr $ra                   # return
