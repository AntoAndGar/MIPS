.text
.globl main

main:
	lw $t1, Memole
	andi $t2, $t1, 4
	srl $t0, $t2, 2

	li $v0,10
	syscall
	
.data
Memole: .word 12