# Scrivere un programma in linguaggio assembly MIPS che riceve in ingresso una sequenza di N numeri interi. 
# I numeri sono memorizzati in un vettore. Il valore N è inserito dall’utente, ma il vettore può contenere al massimo 30 numeri. 
# Terminato l’inserimento della sequenza di numeri, il programma deve verificare se gli elementi del vettore sono tutti uguali tra loro.

.text
.globl main

main:
	li $t1, 1
	li $t5, 1
loop:
	beq $t0, 10, confronto
	li $v0, 5
	syscall
	mul $t1, $t0, 4
	sw $v0, vect($t1)
	addi $t0, $t0, 1
	j loop
	
confronto: 
	beq $t2, 9, uguali
	mul $t5, $t2, 4
	lw $t3, vect($t5)
	lw $t4, vect+4($t5)
	bne $t3, $t4, diversi
	addi $t2, $t2, 1
	j confronto
	
	
diversi:
	la $a0, div
	li $v0, 4
	syscall
	j fine
	
uguali:
	la $a0, eql
	li $v0, 4
	syscall

fine:
	li $v0, 10
	syscall

.data
vect: .space 120
eql: .asciiz "uguali"
div: .asciiz "diversi"
