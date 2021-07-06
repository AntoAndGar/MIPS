.text
.globl main

main:
	lw $t1, Batman
	lw $t2, Robin
	sgt $t0, $t1, $t2
	
	li $v0, 10
	syscall

.data
Batman: .word 10
Robin: .word 6