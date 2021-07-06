# Dato un intero positivo a definito in memoria, stampare a video "Terzo bit 1" nel caso in cui il terzo bit del numero a sia 1 o  "Terzo bit 0" altrimenti

.text
.globl main

main:
	lw $t1, num
	srl $t1, $t1, 2
	andi $t2, $t1, 1
	beq $t2, 1, sl1
	la $a0, l0
	li $v0, 4
	syscall
	j fine
sl1:
	la $a0, l1
	li $v0, 4
	syscall
	
fine:
	li $v0, 10
	syscall	
	
.data
num: .word 15
l1: .asciiz "Terzo bit 1"
l0: .asciiz "Terzo bit 0"
