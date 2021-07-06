# Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo  a>2 (word) 
# ed un intero  positivo (word) b>1 e ne restituisca in output il prodotto (axb) senza utilizzare l'istruzione mul.
# Esempio
# INPUT (a): 10
# INPUT (b): 5
# OUTPUT: 50

.text
.globl main

main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	
loop:
	beq $t2, $t1, fine
	add $t3, $t3, $t0
	addi $t2,$t2, 1
	j loop
	
fine: 
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.data