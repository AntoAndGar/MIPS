# Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo dividendo (word) ed un intero positivo (word) divisore 
# e restituisca in output il quoziente e resto della divisione a/b.
# Esempio
# INPUT (dividendo): 56
# INPUT (divisore): 23
# OUTPUT: Quoziente: 2 Resto:10

.text
.globl main

main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	div $t2, $t0, $t1
	rem $t3, $t0, $t1
	
	la $a0, quot
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, rem
	li $v0,4
	syscall
	
	move $a0, $t3
	li $v0, 1
	syscall 
	
.data
quot: .asciiz "Quoziente: "
rem: .asciiz " Resto: "
