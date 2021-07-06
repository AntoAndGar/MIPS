.text
.globl main

main:
	li $t0, 0
	li $t1, 10
loop:
	beq $t2, $t1, end_loop
	
	li $v0, 5
	syscall
	
	seq $t3, $v0, $t0
	add $t4, $t4, $t3
	
	move $t0, $v0
	
	add $t2, $t2, 1
	j loop

end_loop:
	
	beqz $t4, no_match
	
	li $a0, 1
	li $v0, 1
	syscall
			
	li $v0, 10
	syscall
	
no_match:

	li $a0, -1
	li $v0, 1
	syscall
			
	li $v0, 10
	syscall
.data
