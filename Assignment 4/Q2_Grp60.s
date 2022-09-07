# ---------------------------------------------------------
#   # COMPUTER ORGANIZATION LABORATORY
#   # AUTUMN SEMESTER 2022
#   # Assignment 4
#   # Problem 2: Read a array of 10 elements from console and implement Recursive Sort to Sort the integers in array
#   # Group No. 60
#   # Abhay Kumar Keshari 20CS10001
#   # Hardik Soni 20CS30023
# ---------------------------------------------------------
# 
.globl  main
.data
array: 
    .space 40    
input_prompt:
    .asciiz "Please Enter Array Elements:\n\n"
prompt_input:
    .asciiz "Enter Element with Index "
prompt_idx:
    .asciiz " (Zero Based Indexing)"
output_prompt:
    .asciiz "\nSorted Array: "
colon:
    .asciiz " : "
newline:
    .asciiz "\n"                                
whitespace:
    .asciiz " "
.text
main:
    jal     initStack
    li      $t0, 0                  # index
    li      $t1, 0                  # offset

    li      $v0, 4                  # load print_string system call code into register $v0      
    la      $a0, input_prompt       # load address of string input_prompt to be printed into $a0
    syscall                         # print input_prompt

    readArray:
        li      $v0, 4              # load print_string system call code into register $v0
        la      $a0, prompt_input   # print prompt_input
        syscall                     # print prompt_input
        li      $v0, 1              # load print_int system call code into register $v0
        move    $a0, $t0            # load address of string input1_prompt to be printed into $a0
        syscall
        li      $v0, 4              # load print_string system call code into register $v0
        la      $a0, prompt_idx     # print prompt_idx
        syscall
        li      $v0, 4              # load print_string system call code into register $v0
        la      $a0, colon          # load address of string colon to be printed into $a0
        syscall                     # print colon
        li      $v0, 5              # load read_int system call code into register $v0
        syscall                     # read integer which is the ith element of the array
        sw      $v0, array($t1)         # store at M[array+offset]
        addi    $t0, $t0, 1             # increment index
        addi    $t1, $t1, 4             # update offset
        blt     $t0, 10, readArray      # iterate to read next integer

    la      $a0, array              # load base address of array into register $a0
    li      $a1, 0                  # load immediate the value of zero(start idx) into $a1
    li      $a2, 9                  # load immediate the value of nine(end idx) into $a2
    jal     recursive_sort          # call recursive sort

    # print output_prompt "Sorted Array: "
    output_instr:
        li      $v0, 4                  # load print_string system call code into register $v0
        la      $a0, output_prompt      
        syscall                         # print output_prompt
        la      $a0, array              # load base address of array into register $a0
        li      $a1, 10                 # load immediate the value of ten(size) into $a1
        jal     print                   # calling function print
    
    move    $sp, $fp                    
    lw      $fp, 0($sp) 
    addi    $sp, $sp, 4                # restoring 
    j       Exit_Instruction           # exit instruction

recursive_sort:
    move    $t0, $ra        # move return address to t0
    jal     initStack       # initialise stack
    move    $t1, $a0        # move base address of array into t1
    move    $a0, $t0        # ra at fp-4
    jal     pushToStack
    move    $a0, $s0        # s0 at fp-8
    jal     pushToStack
    move    $a0, $s1        # s1 at fp-12
    jal     pushToStack
    move    $a0, $s2        # s2 at fp-16
    jal     pushToStack     # push to stack

    move    $a0, $t1        # A at fp-20
    jal     pushToStack 
    move    $a0, $a1        # left at fp-24
    jal     pushToStack
    move    $a0, $a2        # right at fp-28
    jal     pushToStack

    lw      $s0, -24($fp)        # l: s0 <- left
    lw      $s1, -28($fp)        # r: s1 <- right
    lw      $s2, -24($fp)        # p: s2 <- left

    recursive_sort_outer_while:
        bge     $s0, $s1, recursive_sort_outer_while_break     # l >= r then exit the outer loop
        recursive_sort_inner_while_l:
            lw      $t0, -28($fp) 
            bge     $s0, $t0, recursive_sort_inner_while_l_end   # l >= right then exit the inner_while loop ro increament l

            lw      $t3, -20($fp)   # t3 <- A 
            sll     $t0, $s0, 2     # t0 <- 4 * l
            add     $t0, $t3, $t0   # t0 <- 4 * l + A
            lw      $t0, 0($t0)     # t0 <- A[l]     
            sll     $t1, $s2, 2     # t1 <- 4 * p
            add     $t1, $t3, $t1   # t1 <- 4 * p + A
            lw      $t1, 0($t1)     # t1 <- A[p]

            bgt     $t0, $t1, recursive_sort_inner_while_l_end   # A[l] > A[p] then exit the inner loop for l
 
            addi    $s0, $s0, 1     # l++
            j       recursive_sort_inner_while_l # jump to inner loop to increament l  
        recursive_sort_inner_while_l_end:

        recursive_sort_inner_while_r:  
            lw      $t0, -24($fp)        # load value of l into $t0
            ble     $s1, $t0, recursive_sort_inner_while_r_end  # r <= left then exit the loop

            lw      $t3, -20($fp)        # t3 <- A 
            sll     $t0, $s1, 2          # t0 <- 4 * r
            add     $t0, $t3, $t0        # t0 <- 4 * r + A
            lw      $t0, 0($t0)          # t0 <- A[r]
            sll     $t1, $s2, 2          # t1 <- 4 * p
            add     $t1, $t3, $t1        # t1 <- 4 * p + A
            lw      $t1, 0($t1)          # t1 <- A[p]

            blt     $t0, $t1, recursive_sort_inner_while_r_end  # A[r] < A[p] then exit the loop  
            addi    $s1, $s1, -1      # r--                          
            j       recursive_sort_inner_while_r    # continue to iterate over the loop                
        recursive_sort_inner_while_r_end:

        recursive_sort_SWAP_first:
            blt     $s0, $s1, recursive_sort_SWAP_second  # if l < r then move to SWAP(A[l], A[r]);
 
            lw      $a0, -20($fp)       # a0 <- A
            move    $a1, $s2            # a1 <- p
            move    $a2, $s1            # a2 <- r
            jal     SWAP                # call SWAP

            lw      $a0, -20($fp)       # a0 <- A
            lw      $a1, -24($fp)       # a1 <- l
            addi    $a2, $s1, -1        # a2 <- r-1
            jal     recursive_sort      # call recursive_sort

            lw      $a0, -20($fp)       # a0 <- A
            addi    $a1, $s1, 1         # a1 <- r+1
            lw      $a2, -28($fp)       # a2 <- right
            jal     recursive_sort      # call recursive_sort

            j       recursive_sort_outer_while_break    # break the loop iteration

        recursive_sort_SWAP_second:    
            lw      $a0, -20($fp)     # a0 <- A
            move    $a1, $s0          # a1 <- l
            move    $a2, $s1          # a2 <- r
            jal     SWAP              # call SWAP
            j       recursive_sort_outer_while  # break the loop iteration

    recursive_sort_outer_while_break:

    lw      $ra, -4($fp)      # restore return address
    lw      $s0, -8($fp)      # restore A
    lw      $s1, -12($fp)     # restore l
    lw      $s2, -16($fp)     # restore r
    move    $sp, $fp          # unwind stack frame of recursive_sort function
    lw      $fp, 0($sp)     
    addi    $sp, $sp, 4     
    jr      $ra      
      
SWAP:
    sll     $t0, $a1, 2         # t0 <- 4 * i
    add     $t0, $a0, $t0       # t0 <- 4 * i + A
    lw      $t2, 0($t0)         # t2: A[i]   
    sll     $t1, $a2, 2         # t1 <- 4 * j
    add     $t1, $a0, $t1       # t1 <- 4 * j + A
    lw      $t3, 0($t1)         # t3: A[j] 

    sw      $t2, 0($t1)         # A[j] = $t2 = A[i] (original value)
    sw      $t3, 0($t0)         # A[i] = $t3 = A[j] (original value)
    jr		$ra			        # jump back to calling address

print: 
    li      $t0, 0              # index
    move    $t1, $a0            # A+4*index
    print_i:
        bge     $t0, $a1, print_end   # end if index is out of range

        lw      $a0, 0($t1)           # load integer to be printed into $a0
        li      $v0, 1             
        syscall                       # print A[i]
        li      $v0, 4                # load print_string system call code into register $v0
        la      $a0, whitespace       
        syscall                       # print whitespace

        addi    $t0, $t0, 1           # t0 <- t0 + 1
        addi    $t1, $t1, 4           # t1 <- t1 + 4
        j       print_i               # Unconditional Jump to print_i 
    print_end:
        jr      $ra                   # Jump back to calling address

initStack:
    addi    $sp, $sp, -4             
    sw      $fp, 0($sp)     
    move    $fp, $sp        
    jr		$ra

pushToStack:
    addi    $sp, $sp, -4    
    sw      $a0, 0($sp)     
    jr      $ra

Exit_Instruction:                   # Exit the Program
    li      $v0, 10     
    syscall
