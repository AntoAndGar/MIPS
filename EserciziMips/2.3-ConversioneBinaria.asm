# Implementare un programma in linguaggio assembly MIPS che legga da input un intero e calcoli il numero di 1 della sua rappresentazione binaria.
# Esempio
# INPUT: 521 (in binario 1000001001)
# OUTPUT:3

.text
.globl main

main:
	
	li $v0, 5
	syscall
	move $t0, $v0
	
loop:
	bge $t3, 32, fine
	andi $t1, $t0, 1
	add $t2, $t2, $t1
	srl $t0, $t0, 1
	addi $t3, $t3, 1
	j loop 
	
fine:
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.data
