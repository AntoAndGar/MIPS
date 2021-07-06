.text
.globl main

main:
	lw $a0, num
	jal is_prime
	
	move $t2, $v0
	move $a0, $t2
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

is_prime:
	addi $t0, $zero, 2
	
is_prime_test:
	slt $t1, $t0, $a0
	bnez $t1, is_prime_loop
	addi $v0, $zero, 1
	jr $ra
	
is_prime_loop:
	div $a0, $t0
	mfhi $t3
	slti $t4,$t3, 1
	beqz $t4, is_prime_loop_continue
	addi $v0, $zero, 2
	jr $ra
	
is_prime_loop_continue:
	addi $t0, $t0, 1
	j is_prime_test

.data
num: .word 16