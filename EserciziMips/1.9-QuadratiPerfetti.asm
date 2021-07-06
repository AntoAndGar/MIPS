.text
.globl main

main:
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $t1, 1
loop:
	bgt $t1, $t0, end_loop
	
	mul $t2, $t1, $t1
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $t3, virgola
	move $a0, $t3
	li  $v0, 4
	syscall
	
	addi $t1, $t1, 1
	
	j loop
	
end_loop:

	li $v0, 10
	syscall
	
.data
virgola: .ascii ","
