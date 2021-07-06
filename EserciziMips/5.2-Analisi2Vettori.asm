# Un programma in linguaggio assembly MIPS deve leggere dall’utente due vettori di 5 numeri interi ciascuno. 
# Il programma deve creare un ulteriore vettore, che contenga la copia dei soli elementi pari presenti nei due vettori di partenza,
# e stampare tale vettore.

.text
.globl main

main:
	li $t0, 0
loop1:
	beq $t0, 5, fine1
	li $v0, 5
	syscall
	mul $t1, $t0, 4
	sw $v0, vect1($t1)
	addi $t0, $t0, 1
	j loop1
	
fine1:
	li $t0, 0
	li $t1, 0
loop2:
	beq $t0, 5, fine2 
	li $v0, 5
	syscall
	mul $t1, $t0, 4
	sw $v0, vect2($t1)
	addi $t0, $t0, 1
	j loop2
	
fine2:
	li $t0, 0
	li $t1, 0
	li $t4, 0
	li $t5, 0
loop3:
	beq $t0, 5, fine3
	mul $t1, $t0, 4
	lw $t2, vect1($t1)
	rem $t3, $t2, 2
	addi $t0, $t0, 1
	bnez $t3, loop3
	mul $t5, $t4, 4
	sw $t2, vect3($t5)
	add $t4, $t4, 1
	j loop3
	
fine3:
	li $t0, 0
	li $t1, 0
loop4:
	beq $t0, 5, fine4
	mul $t1, $t0, 4
	lw $t2, vect2($t1)
	rem $t3, $t2, 2
	addi $t0, $t0, 1
	bnez $t3, loop4
	mul $t5, $t4, 4
	sw $t2, vect3($t5)
	add $t4, $t4, 1
	j loop4

fine4:	
	li $t0, 0
	li $t1, 0
loop5:
	beq $t0, $t4, fine5
	mul $t1, $t0, 4
	lw $a0, vect3($t1)
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	addi $t0, $t0, 1
	j loop5
	
fine5:
	li $v0, 10
	syscall
	
.data
vect1: .space 20
vect2: .space 20
vect3: .space 40
virgola: .ascii ","