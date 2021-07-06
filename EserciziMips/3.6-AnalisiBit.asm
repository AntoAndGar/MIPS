#Confrontare due interi positivi a e b, definiti in memoria, e mettere in $t0 il valore 0 se a e' maggiore di b, 1 altrimenti. 
#Non è possibile utilizzare l'istruzione di comparazione tra valori: operare sui singoli bit dei valori.

.text
.globl main

main:
	lw $t1, n1
	lw $t2, n2
	
	xor $t3, $t1, $t2
loop:
	beq $t4, 32, fine
	andi $t5, $t3, 0x80000000
	beq $t5, 0x80000000, confronto
	sll $t1, $t1, 1
	sll $t2, $t2, 1
	sll $t3, $t3, 1 
	add $t4, $t4, 1
	j loop
	
confronto:
	andi $t6, $t1, 0x80000000
	beq $t6, 0x80000000, mag_a
	li $t0, 0
	j fine
mag_a:
	li $t0, 1

fine:
	li $v0, 10
	syscall
.data
n1: .word 5
n2: .word 7
