# Si scriva un programma in linguaggio assembly MIPS che legge due stringhe da tastiera e al suo interno usa una subroutine, 
# denominata SIMILITUDINE, che valuta quanti caratteri alle stesse posizioni delle due stringhe sono uguali.
# La routine riceve due parametri, "le stringhe" (cioè gli indirizzi delle stringhe), e restituisce un numero intero e lo stampa a video.
# Ad esempio:
# SIMILITUDINE ("ciao", "cielo") restituisce 2 in quanto i primi due caratteri sono identici.
# SIMILITUDINE("ciao", "salve") restituisce 0 in quanto nessun carattere alle stesse posizioni sono uguali

.text
.globl main

main:
	la $a0, str1
	li $a1, 255
	li $v0, 8
	syscall
	
	jal STRLEN
	move $t0, $v0
	
	la $a0, str2
	li $a1, 255
	li $v0, 8
	syscall
	
	subi $sp, $sp, 4
	sw $t0, 0($sp)
	jal STRLEN
	move $t1, $v0
	lw $t0 0($sp)
	addi $sp, $sp, 4
	
	la $a0, str1
	la $a1, str2
	move $a2, $t0
	move $a3, $t1
	jal SIMILITUDINE
	
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
STRLEN:
	#a0 address of string
	move $t0, $a0
	move $t1, $a0
len_loop:
	lb $t2, 0($t0)
	beq $t2, $zero, len_end
	addi $t0, $t0, 1
	j len_loop
len_end:
	sub $t3, $t0, $t1
	move $v0, $t3
	jr $ra
	

SIMILITUDINE:
	# a0, a1 addresses of strings
	# a2, a3 length of strings
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	move $t3, $a3
	bgt $t2, $t3, do_nothing
	move $t2, $t3
	
do_nothing:
	li $t4, 0
simil_loop:
	ble $t2, $t4, simil_end
	lb $t5, 0($t0)
	lb $t6, 0($t1)
	seq $t7, $t5, $t6
	add $t8, $t8, $t7
	addi $t4, $t4, 1
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j simil_loop
	
simil_end:
	move $v0, $t8
	jr $ra
	
.data
str1: .space 255
str2: .space 255
