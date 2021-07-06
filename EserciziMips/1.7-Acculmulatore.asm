.text
.globl main

main:
	li $t2, 1
loop:
	li $v0, 5
	syscall
	
	add $t1, $t1, $v0
	mul $t2, $t2, $v0

	ble $t1, 1000, loop
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data