# Data una matrice 4x4 di interi (word) riportare la somma degli elementi presenti lungo le diagonali

.text
.globl main

main:

	la $t0, matrix
	li $t1, 1 # i
	li $t2, 1 # j
	lw $t3, R
	lw $t4, C
	
# for i = 1 to 4
#for j= 1 to 4
# sum all element i=j and put in x
# sum  all element i+j = 5 and put in y
	
r_loop:
	li $t2, 1
c_loop:
	subi $t5, $t1, 1 # point to effective row 
	subi $t6, $t2, 1 #point to effective col
	bne $t1, $t2, no_load
	mul $t7, $t4, $t5
	add $t8, $t6, $t7 # C(r-1)+(c-1)
	mul $t9, $t8, 4
	lw $s0, matrix($t9)
	add $s1, $s1, $s0
no_load:
	addi $t2, $t2, 1
	ble $t2, $t3, c_loop
	addi $t1, $t1, 1
	ble $t1, $t3, r_loop
	
	li $t1, 1 # i
	li $t2, 1 # j
	
r_loop1:
	li $t2, 1
c_loop1:
	subi $t5, $t1, 1 # point to effective row 
	subi $t6, $t2, 1 #point to effective col
	add $s2, $t1, $t2 
	bne $s2, 5, no_load1
	mul $t7, $t4, $t5
	add $t8, $t6, $t7 # C(r-1)+(c-1)
	mul $t9, $t8, 4
	lw $s0, matrix($t9)
	add $s1, $s1, $s0
no_load1:
	addi $t2, $t2, 1
	ble $t2, $t3, c_loop1
	addi $t1, $t1, 1
	ble $t1, $t3, r_loop1


	move  $a0, $s1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data
matrix: .word 45, 235, 142, 3,
	   124, 6, 337, 2353, 
	   3546, 670, 104, 3465,
	   60000, 456, 5673, 10000
R: .word 4
C: .word 4