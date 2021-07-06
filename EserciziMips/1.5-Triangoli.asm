.text
.globl main

main:
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 5
	syscall
	move $t2, $v0	

	li $v0, 5
	syscall
	move $t3, $v0
	
	
	seq $t4, $t1, $t2
	seq $t5, $t1, $t3
	seq $t6, $t2, $t3
	
	and $t7, $t4, $t5
	and $t7, $t7, $t6
	beq $t7, 1, equilatero
	or $t8, $t4, $t5
	or $t8, $t8, $t6
	beqz $t8, scaleno
	li $t0, 2
	j fine
	
scaleno:
	li $t0, 0
	j fine

equilatero:
	li $t0, 3
	j fine
	
fine:
	li $v0, 10
	syscall

.data
