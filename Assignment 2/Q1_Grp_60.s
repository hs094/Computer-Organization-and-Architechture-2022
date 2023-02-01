# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 2
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------

.globl main

.data

# I/O literals 
input1_prompt:
    .asciiz     "Enter first number: "
input2_prompt:
    .asciiz     "Enter second number: "
error_msg:
    .asciiz     "Error: Entered number(s) is(are) out of range.\n"
output_prompt:
    .asciiz     "Product of the two numbers are: "

.text

# function variables
#   first_integer: $s0
#   second_integer: $s1
#   product: $s2
main:
    input: 
        la      $a0, input1_prompt          # print prompt for first input
        li      $v0, 4
        syscall

        li      $v0, 5                      # read first_integer
        syscall
        move    $s0, $v0 

        la      $a0, input2_prompt          # print prompt for second input
        li      $v0, 4
        syscall

        li      $v0, 5                      # read second_integer
        syscall
        move    $s1, $v0

    sanity_check:
        # input should be 16-bit signed integer 
        # check whether first_integer is within [-2^15, 2^15-1] or not 
        blt     $s0, -32768, input_out_of_range
        bgt     $s0, 32767, input_out_of_range

        # check whether second_integer is within [-2^15, 2^15-1] or not 
        blt     $s1, -32768, input_out_of_range
        bgt     $s1, 32767, input_out_of_range

    # Registers are 32-bit storage container, therefore
    # in order to get 16-bit representation, we keep leftmost 16-bits 0.
    check:
        # first_integer is negative then convert it to 16-bit 2's complement form
        check_s0:
            bge     $s0, $zero, check_s1
            sll     $s0, $s0, 16
            srl     $s0, $s0, 16

        # second_integer is negative then convert it to 16-bit 2's complement form
        check_s1:
            bge     $s1, $zero, endCheck 
            sll     $s1, $s1, 16
            srl     $s1, $s1, 16 

    endCheck:

    call_procedure:
        move    $a0, $s0                    # pass arguments to multiply function 
        move    $a1, $s1

        jal     multiply                    # call booth's multiplication procedure 

        move    $s2, $v0                    # store return value 

    response:
        la      $a0, output_prompt          # print output prompt
        li      $v0, 4
        syscall

        move    $a0, $s2                    # print product of input integers         
        li      $v0, 1 
        syscall

    j       exit                        # exit program  


multiply:
    # function variables
    #   M = $a0 <-- multiplicand
    #   Q = $a1 <-- multiplier
    #   A = $t1 <-- partial product
    #   n = $t2 <-- sequence counter
    #   -M = $t3 <-- 16-bit 2's complement of M  
    #   Q_(-1) = $t0 
    #   Q_0 = $t4 

    li      $t0, 0              # intialize Q_(-1) to zero 
    li      $t1, 0              # intialize A to zero 
    li      $t2, 16             # intialize n to 16 
    sub     $t3, $zero, $a0     # 16-bit 2's complement of M
    sll     $t3, $t3, 16 
    srl     $t3, $t3, 16 

    loop:
        beq     $t2, 0, endLoop         # done when n reduces to 0 
        andi    $t4, $a1, 1             # take out LSB Q_0 of Q  
        beq     $t0, $t4, right_shift   # directly right_shift if both Q_0 and Q_(-1) are 0 or 1

        beq     $t0, 0, case_10         # if Q_0=1 and Q_(-1)=0, goto case_10 

        case_01:
            add     $t1, $t1, $a0       # A <-- A+M
            sll     $t1, $t1, 16        # remove any overflows in 16-bit representation
            srl     $t1, $t1, 16
            j       right_shift         # go to right shift

        case_10:
            add     $t1, $t1, $t3       # A <-- A-M = A + (-M) = A + (~M+1) 
            sll     $t1, $t1 ,16        # remove any overflows in 16-bit representation
            srl     $t1, $t1, 16

        # arithmetic right shift AQQ(-1)
        # A_15..........A_1A_0 Q_15.......Q_1Q_0 Q_(-1) --->> A_15A_15..........A_1 A_0Q_15.......Q_1 Q_0
        # all operations are done maintaining 16-bit representation 
        right_shift:
            andi    $t5, $t1, 1         # take out A_0 int $t5  

            li      $t6, 1              # take out sign-bit A_15 of A
            sll     $t6, $t6, 15
            and     $t6, $t1, $t6       

            sra     $t1, $t1, 1         # right shift A by 1

            or      $t1, $t1, $t6       # fill-up leftmost vacant position in A by sign-bit A_15 because it is arithmetic right shift 

            srl     $a1, $a1, 1         # right-shift Q by 1 

            sll     $t5, $t5, 15        # fill-up A_0 at MSB of Q 
            or      $a1, $a1, $t5       

            move    $t0, $t4            # shift Q0 into Q_(-1)
            
        addi    $t2, $t2, -1            # decrement sequence counter by 1
        j       loop                    # loop again
    endLoop:

    # product P = 16'bA 16'bQ
    # prepend rightmost 16-bits of A to rightmost 16-bits of Q to get Product
    sll     $t1, $t1, 16
    or      $v0, $t1, $a1               # store it in $v0 and return 
    jr      $ra                         # return control back to the caller function 

input_out_of_range:
    la      $a0, error_msg              # print error_msg 
    li      $v0, 4
    syscall
    j       main                        # jump to main to take inputs again

exit:
    li      $v0, 10                     # system call to terminate the program 
    syscall
