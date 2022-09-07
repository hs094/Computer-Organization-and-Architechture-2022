# ---------------------------------------------------------
#   # COMPUTER ORGANIZATION LABORATORY
#   # AUTUMN SEMESTER 2022
#   # Assignment 4
#   # Problem 3: Read an array of 10 elements from console and Sort the integers in array. Implement an algorithm to search a key recursively.
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
prompt_find:
    .asciiz "\nEnter Element to be found: "
prompt_found:
    .asciiz " is FOUND in the array at index "
prompt_not_found:
    .asciiz " NOT FOUND in the array."
delimiter:
    .asciiz "."

.text
main:
    jal     initStack
    li      $t0, 0          # index
    li      $t1, 0          # offset

    li      $v0, 4      
    la      $a0, input_prompt   # print input_prompt
    syscall

    readArray:
        li      $v0, 4
        la      $a0, prompt_input
        syscall
        li      $v0, 1     
        move    $a0, $t0
        syscall
        li      $v0, 4
        la      $a0, prompt_idx
        syscall
        li      $v0, 4      
        la      $a0, colon
        syscall
        li      $v0, 5   
        syscall   
        sw      $v0, array($t1)         # store at M[array+offset]
        addi    $t0, $t0, 1             # increment index
        addi    $t1, $t1, 4             # update offset
        blt     $t0, 10, readArray      # iterate to read next integer

    la      $a0, array  
    li      $a1, 0      
    li      $a2, 9      
    jal     recursive_sort  

    # print output_prompt "Sorted Array: "
    output_instr:
        li      $v0, 4  
        la      $a0, output_prompt
        syscall
        la      $a0, array  
        li      $a1, 10 
        jal     print
    
    li  $v0, 4
    la  $a0, newline
    syscall

    li $v0, 4
    la $a0, prompt_find
    syscall

    li $v0, 5
    syscall

    move $s0, $v0       # s0 <- key 

    la $a0, array
    la $a1, 0
    la $a2, 9
    move $a3, $s0 
    jal recursive_search 
    move $s1, $v0

    bne     $s1, -1, print_prompt_found 
    
    move    $a0, $s0 
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, prompt_not_found
    syscall
    j clear_stack

    print_prompt_found:
        move    $a0, $s0 
        li $v0, 1
        syscall
        li $v0, 4
        la $a0, prompt_found
        syscall
        li $v0, 1
        move $a0, $s1
        syscall
    
    clear_stack:
        move    $sp, $fp
        lw      $fp, 0($sp) 
        addi    $sp, $sp, 4 
    j       Exit_Instruction

recursive_search:
    move $t0, $ra
    jal initStack
    move $t1, $a0
    move $a0, $t0
    jal pushToStack     # ra at fp-4
    move $a0, $t1
    li $v0, -1 

    recursive_search_while_loop:
        bgt $a1, $a2, recursive_search_end
        move $t3, $a2
        sub $t3, $t3, $a1
        div $t3, $t3, 3
        add $t1, $a1, $t3   # t1 <- mid1
        sub $t2, $a2, $t3   # t2 <- mid2


        sll $t5, $t1, 2
        add $t5, $a0, $t5
        lw  $t5, 0($t5)     # t5 <- A[mid1]

        sll $t6, $t2, 2
        add $t6, $a0, $t6
        lw  $t6, 0($t6)     # t6 <- A[mid2]

        recursive_search_if_1: 
            bne $a3, $t5, recursive_search_else_if_2
            move $v0, $t1 
            j recursive_search_end
         
        recursive_search_else_if_2:
            bne $a3, $t6, recursive_search_else_if_3
            move $v0, $t2
            j recursive_search_end

        recursive_search_else_if_3:
            bge $a3, $t5, recursive_search_else_if_4
            addi $a2, $t1, -1
            jal recursive_search
            j recursive_search_end

        recursive_search_else_if_4:
            ble $a3, $t6, recursive_search_else_5
            addi $a1, $t2, 1
            jal recursive_search
            j recursive_search_end

        recursive_search_else_5:
            addi $a1, $t1, 1
            addi $a2, $t2, -1
            jal recursive_search
            j recursive_search_end
    
    recursive_search_end:
        lw $ra, -4($fp)
        move $sp, $fp 
        lw $fp, 0($sp)
        addi $sp, $sp, 4

    jr $ra


recursive_sort:
    move    $t0, $ra    
    jal     initStack   
    move    $t1, $a0    
    move    $a0, $t0        # ra at fp-4
    jal     pushToStack
    move    $a0, $s0        # s0 at fp-8
    jal     pushToStack
    move    $a0, $s1        # s1 at fp-12
    jal     pushToStack
    move    $a0, $s2        # s2 at fp-16
    jal     pushToStack

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
        bge     $s0, $s1, recursive_sort_outer_while_break     
        recursive_sort_inner_while_l:
            lw      $t0, -28($fp) 
            bge     $s0, $t0, recursive_sort_inner_while_l_end   

            lw      $t3, -20($fp)        # t3 <- A 
            sll     $t0, $s0, 2  
            add     $t0, $t3, $t0   
            lw      $t0, 0($t0)     # t0 <- A[l]     
            sll     $t1, $s2, 2     
            add     $t1, $t3, $t1   
            lw      $t1, 0($t1)     # t1 <- A[p]

            bgt     $t0, $t1, recursive_sort_inner_while_l_end  

            addi    $s0, $s0, 1    
            j       recursive_sort_inner_while_l   
        recursive_sort_inner_while_l_end:

        recursive_sort_inner_while_r:
            lw      $t0, -24($fp)
            ble     $s1, $t0, recursive_sort_inner_while_r_end

            lw      $t3, -20($fp)        # t3 <- A 
            sll     $t0, $s1, 2     
            add     $t0, $t3, $t0
            lw      $t0, 0($t0)         # t0 <- A[r]
            sll     $t1, $s2, 2     
            add     $t1, $t3, $t1   
            lw      $t1, 0($t1)         # t1 <- A[p]

            blt     $t0, $t1, recursive_sort_inner_while_r_end       
            addi    $s1, $s1, -1                            
            j       recursive_sort_inner_while_r                
        recursive_sort_inner_while_r_end:

        recursive_sort_SWAP_first:
            blt     $s0, $s1, recursive_sort_SWAP_second

            lw      $a0, -20($fp)     
            move    $a1, $s2       
            move    $a2, $s1       
            jal     SWAP

            lw      $a0, -20($fp)  
            lw      $a1, -24($fp)   
            addi    $a2, $s1, -1    
            jal     recursive_sort 

            lw      $a0, -20($fp)  
            addi    $a1, $s1, 1     
            lw      $a2, -28($fp)   
            jal     recursive_sort  

            j       recursive_sort_outer_while_break

        recursive_sort_SWAP_second:
            lw      $a0, -20($fp) 
            move    $a1, $s0       
            move    $a2, $s1       
            jal     SWAP           
            j       recursive_sort_outer_while

    recursive_sort_outer_while_break:

    lw      $ra, -4($fp)    
    lw      $s0, -8($fp)    
    lw      $s1, -12($fp)   
    lw      $s2, -16($fp)   
    move    $sp, $fp     
    lw      $fp, 0($sp)     
    addi    $sp, $sp, 4     
    jr      $ra      
      
SWAP:
    sll     $t0, $a1, 2     
    add     $t0, $a0, $t0   
    lw      $t2, 0($t0)         # t2: A[i]   
    sll     $t1, $a2, 2     
    add     $t1, $a0, $t1   
    lw      $t3, 0($t1)         # t3: A[j] 

    sw      $t2, 0($t1)         # A[j] = $t2 = A[i] 
    sw      $t3, 0($t0)         
    jr		$ra			    

print: 
    li      $t0, 0      # index
    move    $t1, $a0      # A+4*index
    print_i:
        bge     $t0, $a1, print_end  

        lw      $a0, 0($t1) 
        li      $v0, 1      
        syscall             
        li      $v0, 4     
        la      $a0, whitespace 
        syscall

        addi    $t0, $t0, 1 
        addi    $t1, $t1, 4         
        j       print_i 
    print_end:
        jr      $ra     

initStack:
    addi    $sp, $sp, -4    
    sw      $fp, 0($sp)     
    move    $fp, $sp        
    jr		$ra

pushToStack:
    addi    $sp, $sp, -4    
    sw      $a0, 0($sp)     
    jr      $ra

Exit_Instruction:
    li      $v0, 10     
    syscall
