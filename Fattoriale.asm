# Fattoriale (funzionante fino a 17)

.text
.globl main
main:
	li $v0, 5
	syscall
	move $a0, $v0
	jal fattoriale
	move $a0, $v0
	li $v0, 36
	syscall
	li $v0, 10
	syscall
	
fattoriale:
	ble $a0, 1, caso_base
	subi $sp, $sp, 8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	subi $a0, $a0, 1
	jal fattoriale
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	mulu $v0, $v0, $a0
	jr $ra
	
caso_base:
	li $v0, 1
	jr $ra