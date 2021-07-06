# Definita una matrice in memoria di 8 righe e 8 colonne con elementi halfword, 
# A(8x8), stampare in output una nuova matrice B(8x4) in cui le colonne sono date dal prodotto degli elementi delle colonne della matrice originaria:
# cioè B(4x8) b(1,1)=a(1,1)*a(1,2); b(1,2)=a(1,3)*a(1,4); b(1,3)=a(1,5)*a(1,6); b(1,4)=a(1,7)*a(1,8).
#

.text
.globl main

main:
	li $t0, 8
	li $t1, 4
	li $t2, 1
riga:
	li $t3, 1
colonna:
	subi $t4, $t2, 1
	subi $t5, $t3, 1
	mul $t4, $t4, $t0
	add $t6, $t4, $t5
	mul $t7, $t6, 2
	lh $t8, mat($t7)
	lh $t9, mat+2($t7)
	
	mul $t8, $t8, $t9
	move $a0, $t8 
	li $v0, 1
	syscall
	
	la $a0, tab
	li $v0, 4
	syscall
	
	addi $t3, $t3, 2
	ble $t3, $t0, colonna
	
	la $a0, nl
	li $v0, 4
	syscall
	
	addi $t2, $t2, 1
	ble $t2, $t0, riga
	
	li $v0, 10
	syscall
	
.data
mat: .half 2, 4, 6, 7, 0, 12, 3, 8,
	 1, 10, 5, 16, 0, 1, 1, 10,
	 0, 3, 20, 21, 1, 1, 2, 4,
	 2, 22, 6, 0, 0, 12, 37, 0,
	 30, 50, 1, 34, 0, 5, 4, 13,
	 10, 63, 8, 8, 1, 6, 5, 3,
	 5, 4, 0, 1, 0, 9, 6, 2,
	 41, 0, 14, 2, 0, 14, 0, 1
tab: .asciiz "\t"
nl: .asciiz "\n"