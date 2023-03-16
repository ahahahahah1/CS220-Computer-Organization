.data
inputSizePrompt: .asciiz "Input the size of array to be sorted:\n"
arrayInputPrompt: .asciiz "Enter the numbers:\n"
arr: .float 0.123, 0.2735, 0.372, 0.1532, 0.1425, 0.2456, 0.314, 0.572
p: .word 8
temp: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

.text
.globl main
main:
; # Print prompt to input the size of the array
;     li      $v0, 4
;     la      $a0, inputSizePrompt
;     syscall

; # Taking the size as input
;     li      $v0, 5
;     syscall
;     move    $s0, $v0            # p is stored in $s0

; # Initializing number of buckets to 10
;     addi    $s1, $zero, 10      # n is stored in $s1

; # Print prompt to input the numbers
;     li      $v0, 4
;     la      $a0, arrayInputPrompt
;     syscall

; # Allocating space for arrays based on input
;     add     $t0, $s0, $zero         # Size of arr[]
;     sll     $t0, $t0, 2             # Number of bytes
;     sub     $sp, $sp, $t0           # Allocating space on stack
;     move    $s2, $sp                # Base address of arr[]

;     sub     $sp, $sp, $t0           # Allocating space on stack
;     move    $s3, $sp                # Base address of bucket[]

;     mul     $t0, $s0, $s1           # Size of n * p
;     sll     $t0, $t0, 2             # Number of bytes
;     sub     $sp, $sp, $t0           # Allocating space on stack
;     move    $s4, $sp                # Base address of temp[][]

;     sll     $t0, $s1, 2             # Number of bytes for indices
;     sub     $sp, $sp, $t0           # Allocating space on stack
;     move    $s5, $sp                # Base address of indices[]

; # Running the loop to take the input
;     # Initialization of loop
;     add    $t1, $zero, $zero   # i is stored in $s2 and initiailized to 0

; InputLoop:
;     # Testing condition
;     slt     $t0, $t1, $s0               # $t0 = 1 if i < p
;     beq     $t0, $zero, InputLoopExit   # Exit loop if $t0 is 0

;     # Scanning the float inputs
;     li      $v0, 6
;     syscall                     # Input is now stored in $f0

;     sll     $t2, $t1, 2         
;     add     $t2, $t2, $s2       # Address of arr[i] is now stored in $2
;     swc1    $f0, 0($t2)         # The input is now stored in arr[i]

;     lwc1    $f12, 0($t2)        # The input is now ready to be printed

;     li      $v0, 2
;     syscall

;     addi    $t1, $t1, 1         # Incrementing i by 1

; InputLoopExit:
;     li      $v0, 10
;     syscall

    lwc1    $f12, arr
    li      $v0, 2
    syscall

    li      $v0, 10
    syscall