# Scrivere un programma in linguaggio assembly MIPS che riceve in ingresso una sequenza di N numeri interi. 
# I numeri sono memorizzati in un vettore. Il valore N è inserito dall’utente prima della lettura del vettore, 
# ma il vettore può contenere al massimo 30 numeri. Terminato l’inserimento della sequenza di numeri, 
# il programma deve verificare se il vettore contiene una sequenza di numeri ordinata in modo strettamente crescente.
# ESEMPIO
# INPUT 5 - 3;5;8;10;22
# OUTPUT: ORDINAMENTO STRETTAMENTE CRESCENTE
# INPUT 5 - 3;5;8;22;10
# OUTPUT: ORDINAMENTO CASUALE

.text
.globl main

main:

	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0
	la $t6, vect
loop:
	beq $t1, $t0, verifica
	li $v0, 5
	syscall
	sll $t2, $t1, 2
	add $t2, $t2, $t6
	sw $v0, 0($t2)
	addi $t1, $t1, 1
	j loop
	
verifica:
	div $t3, $t0, 2
	li $t1, 0
	li $t2, 0
loop1:
	beq $t1, $t3, cresc
	mul $t2, $t1, 4
	lw $t4, vect($t2)
	lw $t5, vect+4($t2)
	bgt $t4, $t5, rand 
	addi $t1, $t1, 1
	j loop1
	
rand: 
	la $a0, casuale
	li $v0, 4
	syscall
	j fine
	
cresc:
	la $a0, crescente
	li $v0, 4
	syscall

fine:
	li $v0, 10
	syscall

.data
vect: .space 120
crescente: .asciiz "Ordinamento strettamente crescente"
casuale: .asciiz "Ordinamento casuale"
