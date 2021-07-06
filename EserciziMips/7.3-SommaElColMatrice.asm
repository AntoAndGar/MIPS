# Definita in memoria una matrice di 4 righe e 4 colonne con elementi byte,
# stampare in output la somma degli elementi presenti lungo una colonna 
# ESEMPIO
# MEMORIA
# 3 6 7 8
# 1 5 2 0
# 6 8 10 5
# 4 1 -9 2
# OUTPUT
# COLONNA 1: 14
# COLONNA 2: 20
# COLONNA 3: 10
# COLONNA 4: 15

.text
.globl main

.macro print_string($s)
	la $a0, $s 
	li $v0, 4
	syscall
.end_macro

.macro print_int($i)
	move $a0, $i
	li $v0, 1
	syscall
.end_macro


main:
	li $t0, 4
	li $t1, 1 # row index
	
row:
	li $t2, 1 # col index
column:
	subi $t4, $t1, 1
	mul $t5, $t4, $t0
	subi $t3, $t2, 1
	add $t5, $t5, $t3
	lb $t6, matrix($t5)
	
	beq $t2, 1, id_1
	beq $t2, 2, id_2
	beq $t2, 3, id_3
	beq $t2, 4, id_4
	
id_1:
	add $s0, $s0, $t6
	j end
id_2:
	add $s1, $s1, $t6
	j end
id_3:
	add $s2, $s2, $t6
	j end
id_4:
	add $s3, $s3, $t6
end:
	addi $t2, $t2, 1
	ble $t2, $t0, column
	
	addi $t1, $t1, 1
	ble $t1, $t0, row
	
	print_string(col1)
	print_int($s0)
	print_string(riga)
	print_string(col2)
	print_int($s1)
	print_string(riga)
	print_string(col3)
	print_int($s2)
	print_string(riga)
	print_string(col4)
	print_int($s3)
	
	li $v0, 10
	syscall
	
.data
matrix: .byte 3, 6, 7, 8,
	    1, 5, 2, 0,
	    6, 8, 10, 5,
	    4, 1, -9, 2
col1: .asciiz "Colonna 1: "
col2: .asciiz "Colonna 2: "
col3: .asciiz "Colonna 3: "
col4: .asciiz "Colonna 4: "
riga: .asciiz "\n"