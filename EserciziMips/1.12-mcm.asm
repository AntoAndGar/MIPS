# Si scriva un programma in linguaggio assembly MIPS per calcolare il minimo comune multiplo (MCM) di due numeri interi positivi immessi da tastiera. 
# Stampare il MCM. Dati due numeri interi N1 e N2, il minimo comune multiplo è il più piccolo numero M che è divisibile (con resto pari a zero) sia per N1 che per N2.
# Suggerimento. Si considerino due numeri interi N1 e N2. Sia N1 più grande di N2. Il MCM è il primo multiplo di N1 che è divisibile (con resto uguale a zero) per N2.
# NB:la stampa deve avvenire da consolle output dell'emulatore MARS

.text
.globl main

main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	mul $t3, $t0, $t1
	
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
	div $t4, $t3, $t0
	move $a0, $t4
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.data