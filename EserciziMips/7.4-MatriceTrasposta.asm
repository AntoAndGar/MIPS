# Definita una matrice in memoria di 4 righe e 3 colonne A(4x3) con elementi word, stampare in output la matrice trasposta A^t(3x4).
# La matrice trasposta A^t è costituita dagli elementi alla posizione inversa della matrice originale A: cioè A(ai,j) si trova in A^t(aj,i)
#
# ESEMPIO
# A
# 12 74 06 07
# 99 10 11 16
# 00 03 20 21
#
# A^t
# 12 99 00
# 74 10 03
# 06 11 20
# 07 16 21

.text
.globl main

main:
	li $t0, 3
	li $t1, 4
	li $t3, 1 # c index
col:
	li $t2, 1 # r index
riga:
	subi $t4, $t2, 1
	subi $t5, $t3, 1
	mul $t6, $t4, $t1 
	add $t7, $t6, $t5
	mul $t8, $t7, 4
	lw $t9, mat($t8)
	
	move $a0, $t9
	li $v0, 1
	syscall
	
	la $a0, tab
	li $v0, 4
	syscall

	addi $t2, $t2, 1
	ble $t2, $t0, riga
	
	la $a0, line
	li $v0, 4
	syscall
		
	addi $t3, $t3, 1
	ble $t3, $t1, col

	li $v0, 10
	syscall
	
	
	
.data
mat: .word 12, 74, 6, 7,
	 99, 10, 11, 16,
	 0, 3, 20, 21
line: .asciiz "\n"
tab: .asciiz "\t"