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
    
    move    $sp, $fp
    lw      $fp, 0($sp) 
    addi    $sp, $sp, 4 
    j       Exit_Instruction

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
