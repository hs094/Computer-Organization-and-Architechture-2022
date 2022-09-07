# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 4
    # Problem 1: Given n,a,r,m, Populate, print and calculate determinant of n*n matrix with A[i][j]=(*r^(n*i+j))%m
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------

.globl main

.data

#   I/O prompts 
input_prompt:
    .asciiz     "Enter four positive integers (n, a, r and m) : "
error_msg:
    .asciiz     "Error: Entered number(s) is(are) non-positive.\n"
matrix:
    .asciiz     "Matrix A:\n"
output:
    .asciiz     "Final determinant of the matrix A is " 
endl:
    .asciiz     "\n"
tab:
    .asciiz     "\t"
space:
    .asciiz     " "

#   Executable Instructions
.text
main:

    jal     initStack           # initialize call frame of main

    input: 
        li      $v0, 4              # print prompt for input
        la      $a0, input_prompt
        syscall

	    li      $v0, 5              
        syscall                     # read n
        move    $t0, $v0 

	    li      $v0, 5              
        syscall                     # read a 
        move    $t1, $v0 

	    li      $v0, 5              
        syscall                     # read r
        move    $t2, $v0

        li      $v0, 5              
        syscall                     # read m
        move    $t3, $v0
    
    # sanity_check : check whether n, a, r, m all are positive numbers 
    blez    $t0, error
    blez    $t1, error
    blez    $t2, error
    blez    $t3, error

    # store local variables in stack
    move    $a0, $t0 
    jal     pushToStack         # push n at (fp-4)
    move    $a0, $t1 
    jal     pushToStack         # push a at (fp-8)
    move    $a0, $t2 
    jal     pushToStack         # push r at (fp-12)
    move    $a0, $t3  
    jal     pushToStack         # push m at (fp-16)

    # allocate memory for matrix A
    lw      $t0, -4($fp)        # load n from stack
    mult    $t0, $t0            # compute n*n
    mflo    $a0                 # size of memory to be allocated <- n*n
    jal     mallocInStack       # allocate memory for matrix A
    move    $s0, $v0            # s0: base address of matrix A 

    # fill matrix A
    lw      $t0, -4($fp)        # $t0: size of matrix: n
    lw      $t1, -8($fp)        # $t1: stores value of A[i][j]=(a*r^(n*i+j))%m
    lw      $t2, -12($fp)       # $t2: common ratio: r
    lw      $t3, -16($fp)       # $t3: modulo m
    div     $t1, $t3         
    mfhi    $t1                 # initialize $t1 = a%m
    move    $t4, $s0            # $t4: address of A[i][j], initialized to base address
    li      $t5, 0              # $t5: row index: i, i=0
    loop_i:
        bge     $t5, $t0, end_i     # i>=n, matrix A filled up successfully 
        li      $t6, 0              # $t6: column index: j, j=0 
        loop_j:
            bge     $t6, $t0, end_j     # j>=n, go to fill-up next row
            sw      $t1, ($t4)          # store value a*r^(n*i+j)%m at A[i][j]
            addi    $t6, $t6, 1         # increment column index j
            addi    $t4, $t4, 4         # update address for next element
            mult    $t1, $t2            # update value for next element , A[i][j+1] = (A[i][j]*r)%m
            mflo    $t1
            div     $t1, $t3
            mfhi    $t1 
            j       loop_j              # loop to fill next element of i-th row
            
        end_j:
        addi    $t5, $t5, 1         # increment row index i
        j       loop_i              # loop to fill next row
    end_i:

    # print matrix A:
    la      $a0, matrix
    li      $v0, 4
    syscall
    lw      $a0, -4($fp)        # arguments for printMatrix function: n, A
    move    $a1, $s0 
    jal     printMatrix         # call printMatrix function to print matrix A

    # calculate determinant of A:
    # determinant(n, A)
    lw      $a0, -4($fp)        # a0 <- n
    move    $a1, $s0            # a1 <- A
    jal     determinant         
    move    $s1, $v0            # save value of determinant
    la      $a0, output         # print output prompt
    li      $v0, 4 
    syscall
    move    $a0, $s1            # print value of determinant 
    li      $v0, 1
    syscall
    la      $a0, endl
    li      $v0, 4 
    syscall
 
    move    $sp, $fp            # unwind stack frame of main
    lw      $fp, ($sp)          # restore old frame pointer
    addi    $sp, $sp, 4
    j       exit                # exit program

determinant:
    move    $t0, $ra
    jal     initStack           # initialize call frame of determinant
    move    $t1, $a0
    move    $a0, $t0
    jal     pushToStack         # ra at fp-4
    move    $a0, $s0            
    jal     pushToStack         # s0 at fp-8 
    move    $a0, $s1
    jal     pushToStack         # s1 at fp-12
    move    $a0, $s2
    jal     pushToStack         # s2 at fp-16
    move    $a0, $s3
    jal     pushToStack         # s3 at fp-20
    move    $a0, $t1
    jal     pushToStack         # n at fp-24
    move    $a0, $a1 
    jal     pushToStack         # A at fp-28

    lw      $s0, -24($fp)       # $s0 <- n
    beq     $s0, 1, base_case   # base case: n=1

    addi    $t0, $s0, -1        # $t0 <- n-1
    mult    $t0, $t0
    mflo    $a0                 # $a0 <- (n-1)*(n-1)
    jal     mallocInStack       # allocate buffer of size (n-1)*(n-1), say B
    move    $s1, $v0            # $s1 <- B
     
    li      $s2, 0          # det: $s2 <- 0

    li      $s3, 0          # j: s3 <- 0

    # det(A) = sum_over_j{A[i][j]*(-1)^(i+j)*M_ij} 
    # expand about 0-th row
    repeat:
        bge     $s3, $s0, finish    # j>=n, return computed determinant ($s2) 

        # compute matrix B to calculate minor M_0j=det(B)
        # submatrix(n,A,j,B)
        move    $a0, $s0            # $a0 <- n
        lw      $a1, -28($fp)       # $a1 <- A
        move    $a2, $s3            # $a2 <- j
        move    $a3, $s1            # $a3 <- B
        jal     subMatrix

        # M_0j = determinant(n-1, B)
        addi    $a0, $s0, -1        # $a0 <- n-1
        move    $a1, $s1            # $a1 <- B
        jal     determinant

        lw      $t0, -28($fp)       # $t0 <- A   
        sll     $t1, $s3, 2
        add     $t1, $t0, $t1       # $t1 <- A+4*j
        lw      $t2, 0($t1)         # $t2 <- A[0][j]

        mul     $t3, $t2, $v0       # $t3 <- A[0][j]*M_0j
        andi    $t4, $s3, 1
        beq     $t4, $zero, case_j_even
        sub     $t3, $zero, $t3     # $t3 = -A[0][j]*M_0j if j is odd

        case_j_even:
        add     $s2, $s2, $t3       # det+=A[0][j]*(-1)^(j)*M_0j
        addi    $s3, $s3, 1         # increment j
        j       repeat              # loop for next column
        
    finish:
        move    $v0, $s2            # copy return value to $v0
        j       return

    base_case:
        lw      $t0, -28($fp)       
        lw      $v0, 0($t0)         # det(A_(1x1))=A[0][0]
    return:
        # restore values saved in stsck
        lw      $ra, -4($fp)
        lw      $s0, -8($fp)
        lw      $s1, -12($fp)
        lw      $s2, -16($fp)
        lw      $s3, -20($fp)
        move    $sp, $fp            # unwind stack
        lw      $fp, 0($sp)         # restore old frame pointer
        addi    $sp, $sp, -4
        jr      $ra                 # return control to caller function

subMatrix:
    # start iterating from the second row
    li      $t0, 1      # $t0: row index, i <- 0
    move    $t1, $a0    # $t1: size of A = n
    sll     $a0, $a0, 2 
    add     $t2, $a1, $a0    # &A[i][j] , initialize to A+4*n 
    outerLoop:
        bge     $t0, $t1, endOuter    # i>=n, return
        li      $t3, 0       # $t3: column index, j <- 0
        innerLoop:
            bge     $t3, $t1, endInner  # j>=n, goto next row
            beq     $t3, $a2, end_if    # copy element to matrix B if j is not equal to col
            lw      $t4, 0($t2)         # $t4 <- A[i][j]
            sw      $t4, 0($a3)         # M[a3] <- A[i][j]
            addi    $a3, $a3, 4         # update $a3 

            end_if:
            addi    $t3, $t3, 1     # increment column index
            addi    $t2, $t2, 4     # update address for next element
            j       innerLoop       # jump to check next element in i-th row

        endInner:
        addi    $t0, $t0, 1     # increment row index i
        j       outerLoop       # jump to iterate next row
    endOuter:
    jr      $ra         # return control back to caller function
    
printMatrix:
    move    $t0, $a0            # $t0: number of rows: n
    move    $t1, $a1            # address of A[i][j], initialised to base address
    li      $t2, 0              # $t2: row index: i, i=0
    print_i:
        bge     $t2, $t0, end_print_i   # i>=n, matrix printed successfully 
        li      $t3, 0                  # $t3: column index: j, j=0 

        print_j:
            bge     $t3, $t0, end_print_j  # j>=n, go to print next row 
            lw      $a0, ($t1)          # load value at address matrix+4*(i*n+j) 
            li      $v0, 1              # print_int
            syscall
            la      $a0, space          # print space
            li      $v0, 4
            syscall
            addi    $t3, $t3, 1         # increment column index j
            addi    $t1, $t1, 4         # update address for next element
            j       print_j             # loop to print next element of i-th row
        end_print_j:
        la  $a0, endl            # print endl
        li  $v0, 4
        syscall
        addi    $t2, $t2, 1         # increment row index i
        j       print_i             # loop to print next row
    end_print_i:

    la  $a0, endl            # print endl
    li  $v0, 4
    syscall
    jr  $ra                     # return control back to caller function

initStack:
    addi    $sp, $sp, -4        # create space to save old frame pointer
    sw      $fp, 0($sp)          # save old frame pointer
    move    $fp, $sp            # redirect frame pointer to point to bottom of call frame of current function 
    jr      $ra                 # return control back to caller function

mallocInStack:
    sll     $t0, $a0, 2         # compute number of bytes to be allocated 
    sub     $sp, $sp, $t0       # create required space
    move    $v0, $sp            # return first address of allocated memory
    jr      $ra                 # return control back to caller function

pushToStack:
    addi    $sp, $sp, -4        # create memory space
    sw      $a0, ($sp)          # save value in stack
    jr      $ra                 # return control back to caller function


error:
    li      $v0, 4              # system call to print error_msg 
    la      $a0, error_msg      
    syscall                     
    j       input               # jump to take inputs again

exit:
    li      $v0, 10             # system call to exit program
    syscall                     
