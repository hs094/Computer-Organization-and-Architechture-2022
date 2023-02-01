# ---------------------------------------------------------
# COMPUTER ORGANIZATION AND ARCHITECTURE LABORATORY AUTUMN 2022
# LAB Assignment 1
# Group No. 60
# Abhay Kumar Keshari 20CS10001
# Hardik Soni 20CS30023
# Question No. 2
# ---------------------------------------------------------

# This program is intended to take input of 10 integers, sort them nusing bubble sorting algorithm and print the kth largest integer in the list of 10 integers
    .globl  main
    .data
# array allocation
# allocating a space of 40 bytes for 10 integers in the array
array:
    .space 40
# program output text constants
# all string arguements to be outputted at console
whitespace:
    .asciiz " "
msg1:
    .asciiz "Enter 10 integers to be placed in the array: (every number on new line)\n"
msg2:
    .asciiz "Enter the value of k: \n"
msg3:
    .asciiz "Error: The entered value of k is greater than 10!\n"
msg4:
    .asciiz "Error: The entered value of k must be positive!"
msg5:
    .asciiz "The elements of the array in sorted order are :"
msg6:
    .asciiz "The kth largest element in the array is: "
# new line text constants
newline:
    .asciiz "\n"

    .text
# Main program
#
# program variables
#   $s0: loop byte count
#   $s4: k
#   $s2: 4 (byte-size for int)
main:
    li  $s0, 0
    li  $s4, 11
    li  $s2, 4
    li  $v0, 4                          # load print_string system call code into register $v0
    la  $a0, msg1                       # load address of string 'msg1' to be printed into $a0
    syscall
    jal input                           # Calling function 'input'             
    jal input_k                         # Calling function 'input_k' 
    jal sort_array                      # Calling function 'sort_array'
    jal print_messge                    # Calling function 'print_messge'
    jal print                           # Calling function 'print'
    jal find_k_largest                  # Calling function 'find_k_largest'
    j Exit                              # Exit the Program

print_messge:
    li  $v0, 4                          # load print_string system call code into register $v0
    la  $a0, msg5                       # load address of string 'msg5' to be printed into $a0
    syscall                             # Printing the string constant 'msg5'
    jr $ra                              # return control to caller function

input:
    li  $v0, 5                          # load input_integer system call code into register $v0
    syscall                             # take input of a integer 
    sw  $v0, array($s0)                 # store the integer into array
    addi $s0, $s0, 4                    # incrementing the array address by 4 (as int occupies 4 bytes)
    bne $s0, 40, input                  # if we haven't taken 10 integers as input take further input of array
    li  $s0, 0                          # bringing the current pointer stored in $s0 to start of array
    jr  $ra                             # return control to caller function
    
input_k:
    li  $v0, 4                          # load print_string system call code into register $v0
    la  $a0, msg2                       # load address of string 'msg2' to be printed into $a0
    syscall                             # Printing the 'msg2' string onto console
    li  $v0, 5                          # load input_integer system call code into register $v0
    syscall                             # take input of k(to find the Kth largest integer)
    blt $v0, 1, sanity_check1           # Sanity Check for k < 1
    bgt $v0, 10, sanity_check2          # Sanity Check for k > 10
    move $s1, $v0                       # Move input of k to register $s1
    jr  $ra                             # return control to caller function

# Printing Error message 'msg3'(see top) in case user enters value of k greater than 10
sanity_check2:
    li  $v0, 4                          # load print_string system call code into register $v0
    la  $a0, msg3                       # load address of string 'msg3' to be printed into $a0
    syscall                             # Printing the string console 'msg3' string into console
    j   input_k                         # jump to input_k so that user enters the input of k again

# Printing Error message 'msg4'(see top) in case user enters value of k less than 1
sanity_check1:
    li  $v0, 4                          # load print_string system call code into register $v0
    la  $a0, msg4                       # load address of string 'msg4' to be printed into $a0
    syscall                             # Printing the string constant 'msg4' string into console
    j   input_k                         # jump to input_k so that user enters the input of k again

# function to sort the array
sort_array:
    li  $s5, 36                         # Upper Limit of the array
    li  $s3, 0                          # Lower Limit of the array  
    addi $sp, $sp, -4                   
    sub $s5, $s5, $s0
    sw  $ra, 0($sp)
    jal loop_i                          # Jump and link to inner loop
    lw  $ra, 0($sp)                     # load the startn of stack pointer into return address
    addi $s0, $s0, 4                    # i++. Incrementing the loop iterative variable
    addi $sp, $sp, 4                    
    blt $s0, 36, sort_array             # i < N. 
    li  $s0, 0                          # Bring 
    jr  $ra                             # return control to caller function

loop_i:
    move $a0, $s3                       
    addi $a1, $s3, 4
    lw  $t6, array($a0)                 # strore a[j] into $t6
    lw  $t5, array($a1)                 # store a[j+1] into $t5
    bgt $t6, $t5, swap_call             # if(a[j] > a[j+1]) then go to function swap_call
    ble $t6, $t5, loop_j                # if(a[j] < a[j+1]) then go to function loop_j to continue iterating over the outer loop

SWAP:
    lw  $t0, array($a0)                 # Storing the address a[j] into $t0
    lw  $t1, array($a1)                 # storing the address a[j+1] into $t1
    sw  $t0, array($a1)                 # Saving value at index j+1 into $t0
    sw  $t1, array($a0)                 # Saving value at index j into $t1
    jr  $ra                             # return control to caller function
swap_call:
    addi $sp, $sp, -4                   
    sw  $ra, 0($sp)
    jal SWAP                           # Calling function 'SWAP'
    lw  $ra, 0($sp)
    addi $s3, $s3, 4                   # j++. Incrementing the inner loop iterative variable
    addi $sp, $sp, 4                   # moving to the next variable address in stack frame
    blt $s3, $s5, loop_i               # If j >= n-i then go to the outer loop
    jr  $ra                            # return control to caller function

loop_j:
    addi $s3, $s3, 4                   # Exit the loop if i >= n
    blt $s3, $s5, loop_i
    jr  $ra                            # return control to caller function

print:
    li  $v0, 4                         # load print_string system call code into register $v0
    la  $a0, whitespace                # load address of string constant 'whitespace' to be printed into $a0
    syscall                            # Printing the string constant 'whitespace' 
    li  $v0, 1                         # load print_int system call code into register $v0
    lw  $a0, array($s0)                # load the ith element of array into register $a0
    syscall                            # Printing the ith element of array 
    addi $s0, $s0, 4                   # incrementing the current pointer to next element
    blt $s0, 40, print                 # if we reach the end of the array we end printing
    li  $v0, 4                         # load print_string system call code into register $v0
    la  $a0, newline                   # load address of string 'newline' to be printed into $a0    
    syscall                            # Printing the string constant 'newline'
    li  $s0, 0                         # bringing current pointer of array to start ($s0 <-- 0)
    jr  $ra                            # return control to caller function

find_k_largest:
    li  $v0, 4                         # load print_string system call code into register $v0
    la  $a0, msg6                      # load address of string constant 'msg6' to be printed into $a0
    syscall                            # Printing the string constant 'msg6'
    sub $s1, $s4, $s1                  # Substract k from 11 and store into register $s1
    mul $t0, $s1, $s2                  # Multiply value in $s1 with 4
    addi $t0, $t0, -4                  # Calculating the index of the kth largest element
    li  $v0, 1                         # load print_int system call code into register $v0
    lw  $a0, array($t0)                # load word of a[k-1] after sorting into register $a0
    syscall                            # Printing kth largest element
    li  $v0, 4                         # load print_string system call code into register $v0
    la  $a0, newline                   # load address of string 'newline' to be printed into $a0
    syscall                            # Printing the string constant 'newline'
    jr  $ra                            # return control to caller function
    
Exit:
    li $v0, 10                         # load exit system call code into register $v0
    syscall                            # call operating system to exit program