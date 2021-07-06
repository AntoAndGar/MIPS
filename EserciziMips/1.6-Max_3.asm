.text
.globl main

main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	
	ble $v0, $t0, next
	move $t0, $v0

next:
	li $v0, 5
	syscall
		
	ble $v0, $t0, fine
 	move $t0, $v0
	
fine:
	li $v0, 10
	syscall


.data