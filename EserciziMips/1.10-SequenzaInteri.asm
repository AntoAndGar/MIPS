.text
.globl main

main:
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
loop:
	bge $t2, $t1, end_loop
	
	add $t3, $t2, $t0
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	la $a0, spazio
	li $v0, 4
	syscall
	
	add $t2, $t2, 1
	j loop
	
end_loop:
	li $v0, 10
	syscall

.data
spazio: .ascii " "