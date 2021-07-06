# Si scriva un programma in linguaggio assembly MIPS per calcolare il massimo comun divisore (MCD) di due numeri interi positivi. Il MCD è deﬁnito come il massimo tra i divisori comuni ai due numeri. Stampare il MCD.
# Suggerimento. Si considerino due numeri interi N1 e N2. Il MCD di N1 e N2 è il massimo tra i numeri che sono divisori (con resto uguale a zero) sia di N2 che di N1. In particolare, si supponga che sia N1 minore di N2.
# Il MCD è il massimo tra i numeri compresi tra 1 e N1 che sono divisori (con resto uguale a zero) sia di N1 che di N2.

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
	bge $t0, $t1, no_swap
	move $t2, $t0
	move $t0, $t1
	move $t1, $t2
	
no_swap:
	beqz $t1, fine
	
	rem $t2, $t0, $t1
	
	move $t0, $t1
	move $t1, $t2
	
	j loop
fine:
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
			
.data
