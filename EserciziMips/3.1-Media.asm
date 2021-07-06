# Implementare un programma in linguaggio assembly MIPS che dati cinque interi positivi definiti in memoria calcola la media aritmetica
# Esempio
# INPUT: a=0,b=11;c=7;d=1982;e=10051980
# OUTPUT:2010796

.text
.globl main

main:
	bge $t3, 5, fine
	mul $t4, $t3, 4
	lw $t1, numeri+0($t4)
	add $t2, $t2, $t1
	addi $t3, $t3, 1
	j main
	
fine:
	div $t2, $t2, 5
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data
numeri: .word 0, 11, 7, 1982, 10051980