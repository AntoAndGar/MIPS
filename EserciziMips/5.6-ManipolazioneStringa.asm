# Scrivere un programma in linguaggio assembly MIPS che legga una stringa introdotta da tastiera. 
# La stringa contiene sia caratteri maiuscoli che caratteri minuscoli, e complessivamente al più 100 caratteri. 
# Il programma deve svolgere le seguenti operazioni:
# - visualizzare la stringa inserita
# - costruire una nuova stringa in cui il primo carattere di ciascuna parola nella frase di partenza è stato reso maiuscolo. 
#   Tutti gli altri caratteri devono essere resi minuscoli. Il programma deve memorizzare la nuova stringa
# - visualizzare la nuova frase.

.text
.globl main

main:
	la $a0, stringa
	la $a1, 100
	li $v0, 8
	syscall
	
	li $v0, 4
	syscall
	
	li $s0, 96
	li $s1, 122
	li $s2, 32
	
	lb $t2, stringa
	sgt $t3, $t2, $s0
	slt $t4, $t2, $s1
	and $t5, $t3, $t4
	beqz $t5, not_upperable
	subi $t2, $t2, 32
not_upperable:
	sb $t2, result
	li $t1, 1

loop:
	beq $t2, 0, stampa
	lb $t6, stringa+-1($t1)
	lb $t2, stringa($t1)
	sgt $t3, $t2, $s0
	slt $t4, $t2, $s1
	and $t5, $t3, $t4
	seq $t7, $t6, $s2
	and $t8, $t7, $t5
	bne $t8, 1, no_up
	subi $t2, $t2, 32
no_up: 	
	sb $t2, result($t1)
	addi $t1, $t1, 1
	j loop	
	
stampa:
	la $a0, result
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
.data
stringa: .space 100
result: .space 100