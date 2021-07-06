.text
.globl main

main:

loop:
	li $v0, 5
	syscall
	
	addi $t1, $t1, 1
	
	bne $v0, -1, loop
	
	subi $t1, $t1, 1
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data