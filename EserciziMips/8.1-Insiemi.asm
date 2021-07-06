# Si scriva un programma in linguaggio assembly MIPS che definiti due INSIEMI (cioè due vettori halfword) opera su di essi 
# con tre subroutine UNIONE, INTERSEZIONE, DIFFERENZA. In particolare:
# UNIONE ha in input "i due insiemi" (cioè gli indirizzi dei vettori) e restituisce un "nuovo insieme" 
# (cioè l'indirizzo iniziale del vettori) che riporta l'unione dei due insiemi [NB: L'unione fra due 
# insiemi è l'operazione che associa ai due insiemi l'insieme i cui elementi appartengono al primo oppure al secondo insieme]
# INTERSEZIONE ha in input "i due insieme" (cioè gli indirizzi dei vettori) e restituisce un "nuovo insieme" 
# (cioè l'indirizzo iniziale del vettori) che riporta l'intersezione de due insiemi [NB: L'intersezione fra due 
# insiemi è l'operazione che associa ai due insiemi l'insieme i cui elementi appartengono contemporaneamente 
# al primo e al secondo insieme]
# DIFFERENZA ha in input "i due insiemi" (cioè gli indirizzi dei vettori) e restituisce un "nuovo insieme" 
# (cioè l'indirizzo iniziale del vettori) he riporta la differenza dei due insiemi.[NB: Si definisce differenza fra due
# insiemi l'insieme degli elementi del primo insieme che non appartengono al secondo insieme;]
# ESEMPIO:
# Dati gli insiemi
# A = { 1, 2, 3, 4 }
# B = { 3, 4, 5, 6 }
# AunioneB = { 1, 2, 3, 4, 5, 6 }
# AintersezioneB = { 3, 4}
# AdifferenzaB = {1, 2}

.text
.globl main

main:
	la $a0, ins1
	la $a1, ins2
	
	jal UNIONE
	move $t3, $v0
	move $t2, $v1
	la $a0, s_union
	li $v0, 4
	syscall
	
	li $t1, 0
a:
	ble $t2, $t1, end 
	mul $t4, $t1, 2
	add $t5, $t4, $t3
	lh $t6, ($t5) 
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	addi $t1, $t1, 1
	j a
end:	
	la $a0, graffa
	li $v0, 4
	syscall
	
	j fine
	


is_present_half:
	move $t0, $a0 # elem
	move $t1, $a1 # n_elem
	move $t2, $a2 # vector address
	#for each elem in vect if t0==elem return 1 else 0
	li $t3, 0
loop: 
	ble $t1, $t3, no_present
	mul $t4, $t3, 2
	add $t4, $t4, $t2
	lh $t5, ($t4)
	beq $t0, $t5, present
	addi $t3, $t3, 1
	j loop

present:
	li $v0, 1
	jr $ra
no_present:
	li $v0, 0
	jr $ra

	
	
UNIONE:
	move $t4, $a0 # ins1
	move $t5, $a1 # ins2
	
	li $t2, 0
	lw $t3, n_elem
	la $s2, union
u_a_loop:	#for each element in A put in C
	ble $t3, $t2, u_a_fine
	mul $t6, $t2, 2
	add $t7, $t6, $t4
	lh $t8, ($t7) 
	add $t9, $t6, $s2  
	sh $t8, ($t9)
	addi $t2, $t2, 1
	j u_a_loop
u_a_fine:
	move $s1, $t2
	li $t2, 0
u_b_loop:	#and for each elem in B check if is in C if not add it (not efficient)
	ble $t3, $t2, u_b_fine
	mul $t6, $t2, 2
	add $t7, $t6, $t5
	lh $t8, ($t7)
	move $a0, $t8
	move $a1, $t3
	move $a2, $s2
	subi $sp, $sp, 32
	sw $ra, 32($sp)
	sw $t1, 28($sp)
	sw $t2, 24($sp)
	sw $t3, 20($sp)
	sw $t4, 16($sp)
	sw $t5, 12($sp)
	sw $t6, 8($sp)
	sw $t7, 4($sp)
	sw $t8, 0($sp)
	jal is_present_half
	lw $ra, 32($sp)
	lw $t1, 28($sp)
	lw $t2, 24($sp)
	lw $t3, 20($sp)
	lw $t4, 16($sp)
	lw $t5, 12($sp)
	lw $t6, 8($sp)
	lw $t7, 4($sp)
	lw $t8, 0($sp)
	addi $sp, $sp, 32
	addi $t2, $t2, 1
	beq $v0, 1, u_b_loop
	add $t9, $s2, $t3
	mul $t6, $s1, 2
	add $t9, $t6, $s2  
	sh $t8, ($t9)
	addi $s1, $s1, 1
	j u_b_loop
u_b_fine:
	move $v0, $s2
	move $v1, $s1
	jr $ra
	
fine:
	li $v0,10
	syscall

.data
n_elem: .word 4
ins1: .half 1, 2, 3, 4
ins2: .half 3, 4, 5, 6
union: .half 0:8
inter: .half 0:4
diff: .half 0:4
.align 4
s_union: .asciiz "A unione B: { "
.align 4
virgola: .asciiz ", "
.align 4
graffa: .asciiz "}"
