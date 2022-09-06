# ---------------------------------------------------------
#   # COMPUTER ORGANIZATION LABORATORY
#   # AUTUMN SEMESTER 2022
#   # Assignment 4
#   # Problem 2
#   # Read a array of 10 elements from console and implement Recursive Sort to Sort the integers in array
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
    .asciiz " is FOUND in the Array at index "
prompt_not_found:
    .asciiz " NOT FOUND in the array."
delimiter:
    .asciiz "."

.text
main:
    li      $s0, 10 
    li      $t1, 0  
    li      $t0, 0  
    li      $v0, 4      
    la      $a0, input_prompt
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
        sw      $v0, array($t1) 
        addi    $t0, $t0, 1  
        addi    $t1, $t1, 4  
        ble     $t1, 36, readArray  
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
        move    $a1, $s0    
        jal     print 
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 4
    la $a0, prompt_find
    syscall
    li $v0, 5
    syscall
    move $s1, $v0
    la $a0, array
    la $a1, 0
    la $a2, 9
    move $a3, $s1
    jal recursive_search
    move $a0, $s1
    move $t0, $v0
    bne $v0, -1, print_prompt_found
    j print_prompt_not_found
    print_prompt_found:
        li $v0, 1
        syscall
        li $v0, 4
        la $a0, prompt_found
        syscall
        li $v0, 1
        move $a0, $t0
        syscall
        j clear_stack
    print_prompt_not_found:
        li $v0, 1
        syscall
        li $v0, 4
        la $a0, prompt_not_found
        syscall
        j clear_stack
    clear_stack:
        lw      $fp, 0($sp) 
        addi    $sp, $sp, 4 
    jal Exit_Instruction
    
initStack:
    addi    $sp, $sp, -4    
    sw      $fp, 0($sp)     
    move    $fp, $sp        
    jr		$ra

pushToStack:
    addi    $sp, $sp, -4    
    sw      $a0, 0($sp)     
    jr      $ra

recursive_sort:
    move    $t0, $ra    
    jal     initStack   
    move    $t1, $a0    
    move    $a0, $t0    
    jal     pushToStack
    move    $a0, $s0    
    jal     pushToStack
    move    $a0, $s1    
    jal     pushToStack
    move    $a0, $s2    
    jal     pushToStack

    move    $a0, $t1    
    jal     pushToStack 
    move    $a0, $a1    
    jal     pushToStack
    move    $a0, $a2    
    jal     pushToStack

    move    $s0, $a1    
    move    $s1, $a2    
    move    $s2, $a1    
    move    $a0, $t1    

recursive_sort_outer_while:
    blt     $s1, $s0, recursive_sort_outer_while_break     
    recursive_sort_inner_while_l:
        mul     $t0, $s0, 4     
        add     $t0, $a0, $t0   
        lw      $t0, 0($t0)     
        mul     $t1, $s2, 4     
        add     $t1, $a0, $t1   
        lw      $t1, 0($t1)  
        blt     $a2, $s0, recursive_sort_inner_while_r   
        ble     $t1, $t0, recursive_sort_inner_while_r        
        move    $t4, $s0
        addi    $t4, $t4, 1    
        move    $s0, $t4                                    
        b       recursive_sort_inner_while_l                
    recursive_sort_inner_while_r:
        mul     $t0, $s1, 4     
        add     $t0, $a0, $t0   
        lw      $t0, 0($t0)     
        mul     $t1, $s2, 4     
        add     $t1, $a0, $t1   
        lw      $t1, 0($t1)     
        blt     $t0, $t1, recursive_sort_SWAP_first       
        ble     $s1, $a1, recursive_sort_SWAP_first       
        addi    $s1, $s1, -1                            
        b       recursive_sort_inner_while_r            

    recursive_sort_SWAP_first:
        blt     $s0, $s1, recursive_sort_SWAP_second     
        move    $a1, $s2       
        move    $a2, $s1       
        jal     SWAP           
        addi    $a2, $s1, -1    
        lw      $a1, -24($fp)   
        jal     recursive_sort  
        lw      $a2, -28($fp)   
        addi    $a1, $s1, 1     
        jal     recursive_sort  
        j       recursive_sort_outer_while_break
    recursive_sort_SWAP_second:
        move    $a1, $s0       
        move    $a2, $s1       
        jal     SWAP           
        lw      $a2, -28($fp)  
        lw      $a1, -24($fp)  
        j       recursive_sort_outer_while
recursive_sort_outer_while_break:
    lw      $s1, -12($fp)   
    lw      $s2, -16($fp)   
    lw      $ra, -4($fp)    
    lw      $s0, -8($fp)    
    addi    $sp, $sp, 28    
    lw      $fp, 0($sp)     
    addi    $sp, $sp, 4     
    jr      $ra            
SWAP:
    mul     $t0, $a1, 4     
    add     $t0, $a0, $t0   
    lw      $t2, 0($t0)     
    mul     $t1, $a2, 4     
    add     $t1, $a0, $t1   
    lw      $t3, 0($t1)     
    sw      $t2, 0($t1)     
    sw      $t3, 0($t0)     
    jr		$ra			    

print: 
    li      $t0, 0      
    li      $t2, 0      
    move    $s0, $a0    
    print_sorted_array:
        bge     $t0, $a1, print_func_end  
        add     $t1, $s0, $t2       
        lw      $t1, 0($t1)         
        addi    $t2, $t2, 4         
        li      $v0, 1      
        move    $a0, $t1    
        syscall             
        li      $v0, 11     
        li      $a0, 32     
        syscall
        addi    $t0, $t0, 1 
        j       print_sorted_array

print_func_end:
    jr      $ra  

recursive_search:
    move $t0, $ra
    jal initStack
    move $t1, $a0
    move $a0, $t0
    jal pushToStack
    move $a0, $t1
    li $v0, -1 
    bge $a2, $a1, recursive_search_while_loop 
    b recursive_search_end
    # move $t1
    recursive_search_while_loop:
        # Setting the default value of return value
        bgt $a1, $a2, recursive_search_end
        add $t3, $a2, $zero
        sub $t3, $t3, $a1
        div $t3, $t3, 3
        add $t1, $a1, $t3   # mid1
        sub $t2, $a2, $t3   # mid2

        mul $t5, $t1, 4
        add $t5, $a0, $t5
        lw  $t5, 0($t5)     # A[mid1]

        mul $t6, $t2, 4
        add $t6, $a0, $t6
        lw  $t6, 0($t6)     # A[mid2]

        recursive_search_if_1: 
            bne $t5, $a3, recursive_search_else_if_2
            move $v0, $t1
            j recursive_search_end
         
        recursive_search_else_if_2:
            bne $t6, $a3, recursive_search_else_if_3
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
    addi $sp, $sp, 4
    lw $fp, 0($sp)
    addi $sp, $sp, 4
    jr $ra

Exit_Instruction:
    li      $v0, 10     
    syscall