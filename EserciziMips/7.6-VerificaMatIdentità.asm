# Definita una matrice in memoria di N righe e N colonne con elementi halfword, A(NxN), 
# stampare in output il messaggio con la scritta IDENTITA' se la matrice è la matrice identità o NON IDENTITA' altrimenti. 
# Una matrice identità è una matrice costituita da elementi 0 eccetto quelli sulla diagonale principale che hanno valore 1

.text
.globl main

main:
	lh $t0, n
	li $t1, 1

riga:
	li $t2, 1 
colonna:
	subi $t6, $t1, 1
	subi $t7, $t2, 1
	sub $t5, $t2, $t1
	mul $t3, $t6, $t0
	add $t3, $t3, $t7
	mul $t3, $t3, 2
	lh $t4, mat($t3)
	beqz $t5, diag
	beqz $t4, no_diag
	j no_id
diag:
	beq $t4, 1, no_diag
	j no_id
no_diag:
	addi $t2, $t2, 1
	ble $t2, $t0, colonna
	
	addi $t1, $t1, 1
	ble $t1, $t0, riga
	
	la $a0, id
	li $v0, 4
	syscall
	j fine
no_id:
	la $a0, nid
	li $v0, 4
	syscall
	
fine:
	li $v0, 10
	syscall
		
.data
mat: .half 1, 0, 0,
	 0, 1, 0,
	 0, 0, 1
n: .half 3
id: .asciiz "identita'\n"
nid: .asciiz "non identita'\n"