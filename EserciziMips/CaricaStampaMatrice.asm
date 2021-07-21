# Caricamento/ Stampa di una matrice 4x5

.text
.globl main

main:
	la $t0, mat
	lw $t1, R
	lw $t2, C
	li $t3, 0 # index row
	li $t4, 0 # index col
	
	li $a1, 32000
r_loop:
	li $t4, 0
c_loop:
	mul $t5, $t2, $t3
	li $v0, 42
	syscall
	add $t6, $t5, $t4
	mul $t7, $t6, 4
	sw $a0, mat($t7)
	addi $t4, $t4, 1
	blt $t4, $t2, c_loop
	addi $t3, $t3, 1
	blt $t3, $t1, r_loop
	
	li $t3, 0
	
r_loop1:
	li $t4, 0
c_loop1:
	mul $t5, $t2, $t3
	add $t6, $t5, $t4
	mul $t7, $t6, 4
	lw $a0, mat($t7)
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	addi $t4, $t4, 1
	blt $t4, $t2, c_loop1
	la $a0, riga
	li $v0, 4
	syscall
	addi $t3, $t3, 1
	blt $t3, $t1, r_loop1
	
	li $v0, 10
	syscall
	
.data
mat: .word 0:20
R: .word 4
C: .word 5
virgola: .asciiz ", "
riga: .asciiz "\n"
	 
	