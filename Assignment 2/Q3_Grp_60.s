# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 2
    # Problem 3
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------

.globl main

.data

#   I/O prompt literals 
input_prompt:
    .asciiz     "Enter four positive integers m, n, a and r: "
error_msg:
    .asciiz     "Error: Entered number(s) is(are) non-positive.\n"
matrix:
    .asciiz     "Matrix A:\n"
transpose:
    .asciiz     "Matrix B: Transpose(A)\n"
newline:
    .asciiz     "\n"
space:
    .asciiz     " "

#   Executable Instructions
.text
main:

    jal     initStack           # call to initialize call frame of main

    input: 
        li      $v0, 4              # print prompt for input
        la      $a0, input_prompt
        syscall

	    li      $v0, 5              
        syscall                     # read m
        move    $a0, $v0 
        jal     pushToStack         # push m into stack

	    li      $v0, 5              
        syscall                     # read n 
        move    $a0, $v0 
        jal     pushToStack         # push n into stack

	    li      $v0, 5              
        syscall                     # read a
        move    $a0, $v0 
        jal     pushToStack         # push a into stack

        li      $v0, 5              
        syscall                     # read r
        move    $a0, $v0 
        jal     pushToStack         # push r into stack 
    
    sanity_check:
        # check whether m, n, a, r are all positive numbers 
        lw      $t0, -4($fp)
        blez    $t0, error
        lw      $t0, -8($fp)
        blez    $t0, error
        lw      $t0, -12($fp)
        blez    $t0, error
        lw      $t0, -16($fp)
        blez    $t0, error

    allocate_memory:
        lw      $t0, -4($fp)        # load m from stack
        lw      $t1, -8($fp)        # load n from stack 

        mult    $t0, $t1            # compute m*n
        mflo    $a0                 # m*n is argument for mallocInStack
        jal     mallocInStack       # call mallocInStack to allocate memory for matrix A
        move    $s0, $v0            # save first address of matrix A 
        jal     mallocInStack       # call mallocInStack to allocate memory for  matrix B
        move    $s1, $v0            # save first address of matrix B 

    fill_A:
        li      $t0, 0              # $t0: row index: i, i=0
        lw      $t1, -4($fp)        # $t1: number of rows: m
        lw      $s2, -12($fp)       # $s2: stores value of A[i][j], intialize to A[0][0]=a 
        lw      $s3, -16($fp)       # $s3: common ratio: r

        for:
            bge     $t0, $t1, endFor    # i>=m, matrix A filled up successfully 

            li      $t2, 0              # $t2: column index: j, j=0 
            lw      $t3, -8($fp)        # $t3: number of columns: n

            # computing first address of A[i] 
            mult    $t0, $t3
            mflo    $t4                 # $t4 <-- i*n
            sll     $t4, $t4, 2         # $t4 <-- 4*i*n = # of bytes from first address of A 
            add     $t4, $s0, $t4       # $t4: stores address of A[i][j], initialize to A + 4*(i*n) 

            for2:
                bge     $t2, $t3, endFor2   # j>=n, go to fill-up next row 
                sw      $s2, ($t4)          # store value a*r^(n*i+j) at address A+4*(i*n+j) 
                addi    $t2, $t2, 1         # increment column index j
                addi    $t4, $t4, 4         # update address for next element
                mult    $s2, $s3            # update value for next element 
                mflo    $s2
                j       for2                # loop to fill next element of i-th row
            endFor2:
            addi    $t0, $t0, 1         # increment row index i
            j       for                 # loop to fill next row
        endFor:

    print_A:
        la      $a0, matrix
        li      $v0, 4
        syscall
        lw      $a0, -4($fp)        # arguments for printMatrix function: m, n, A
        lw      $a1, -8($fp) 
        move    $a2, $s0     

        jal     printMatrix         # call printMatrix function to print matrix A

    compute_transpose:
        lw      $a0, -4($fp)        # arguments for transposeMatrix function: m, n, A, B
        lw      $a1, -8($fp)
        move    $a2, $s0  
        move    $a3, $s1 

        jal     transposeMatrix     # call transposeMatrix function to populate matrix B = transpose(A)

    print_B:
        la      $a0, transpose
        li      $v0, 4
        syscall

        lw      $a0, -8($fp)        # arguments for printMatrix function: n, m, B
        lw      $a1, -4($fp)
        move    $a2, $s1 

        jal     printMatrix         # call printMatrix function to print Matrix B
 
    move    $sp, $fp            # unwind stack frame of main
    lw      $fp, ($sp)          # restore frame pointer
    addi    $sp, $sp, 4
    j       exit                # exit program

printMatrix:
    li      $t0, 0              # $t0: row index: i, i=0
    move    $t1, $a0            # $t1: number of rows: n_row
    for_:
        bge     $t0, $t1, endFor_   # i>=n_row, matrix printed successfully 

        li      $t2, 0              # $t2: column index: j, j=0 
        move    $t3, $a1            # $t3: number of columns: n_col

        mult    $t0, $t3            
        mflo    $t4                 # $t4 <-- i*n_col
        sll     $t4, $t4, 2         # $t4 <-- 4*i*n_col = # of bytes from first address of matrix
        add     $t4, $a2, $t4       # $t4: stores address of matrix[i][j], initialize to matrix + 4*(i*n_col) 
        for2_:
            bge     $t2, $t3, endFor2_  # j>=n, go to fill-up next row 
            lw      $a0, ($t4)          # load value at address matrix+4*(i*n_col+j) 
            li  $v0, 1                  # print_int
            syscall
            la      $a0, space          # print space
            li  $v0, 4
            syscall
            addi    $t2, $t2, 1         # increment column index j
            addi    $t4, $t4, 4         # update address for next element
            j       for2_               # loop to print next element of i-th row
        endFor2_:
        la  $a0, newline            # print newline
        li  $v0, 4
        syscall
        addi    $t0, $t0, 1         # increment row index i
        j       for_                # loop to print next row
    endFor_:

    la  $a0, newline            # print newline
    li  $v0, 4
    syscall
    jr  $ra                     # return control back to caller function

transposeMatrix:
    li      $t0, 0              # row index of destination matrix: i, i=0
    move    $t1, $a1            # n
    move    $t3, $a0            # m  
    _for:
        bge     $t0, $t1, _endFor   # if i>=n 
        li      $t2, 0              # j=0 
        mult    $t0, $t3            # i*m 
        mflo    $t4                 
        sll     $t4, $t4, 2         # 4*i*m 
        move    $t5, $a3            # B 
        add     $t4, $t5, $t4       # pointer to B = B+4*i*m
        _for2:
            bge     $t2, $t3, _endFor2  # j>=m 
            mult    $t1, $t2            # j*n
            mflo    $t5
            add     $t5, $t5, $t0       # j*n+i 
            sll     $t5, $t5, 2         # 4*(j*n+i) 
            add     $t5, $t5, $a2       # A+4*(j*n+i)
            lw      $t6, ($t5)          # A[j][i]
            sw      $t6, ($t4)          # B[i][j] = A[j][i] 
            addi    $t2, $t2, 1         # j++
            addi    $t4, $t4, 4         # pointer to B++ 
            j       _for2
        _endFor2:
        addi    $t0, $t0, 1         # i++
        j       _for
    _endFor:
    jr  $ra                     # return control back to caller function

initStack:
    addi    $sp, $sp, -4        # create space to save old frame pointer
    sw      $fp, ($sp)          # save old frame pointer
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
    j       main                # jump to main to take inputs again

exit:
    li      $v0, 10             # system call to exit program
    syscall                     



