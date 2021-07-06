# Trasformare il programma nella Traccia 7.1 in una macro.

.text
.globl main

.macro print_matrix
	lw $t0, R
	lw $t1, C
	la $t2, matrix
	li $t3, 1
	la $t6, tab
	la $t7, riga
	mul $t9, $t0, $t1
	addi $t9, $t9, 1
loop:
	beq $t3, $t9, fine
	subi $t8, $t3 1
	mul $t4, $t8, 4
	add $t4, $t4, $t2
	lw $a0, ($t4)
	li $v0, 1
	syscall
	move $a0, $t6
	li $v0, 4
	syscall
	rem $t5, $t3, $t1
	bnez $t5, no_nl
	move $a0, $t7
	li $v0, 4
	syscall
no_nl:
	addi $t3, $t3, 1
	j loop
	
fine:
	li $v0, 10
	syscall
.end_macro

main:
	print_matrix

.data
matrix: .word 0:20
R: .word 5
C: .word 4
tab: .asciiz "\t"
riga: .asciiz "\n"