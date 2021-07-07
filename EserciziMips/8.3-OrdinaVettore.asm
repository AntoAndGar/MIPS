# Si scriva un programma in linguaggio assembly MIPS che mediante la subroutine ORDINA ordina un vettore immesso da input. 
# La routine ORDINA ha come argomento il vettore (cioè l'indirizzo del vettore), e restituisce il vettore ordinato 
# (l'indrizzo del vettore, co gli elementi ordinati).
# Ad esempio
# v=(1,10,6,3,2,4)
# ORDINA(v)=(1,2,3,4,6,10)

.text
.globl main

main:
	la $t0, vec
	lw $s0, n_elem
loop_in:
	bge $t1 , $s0, end_in
	li $v0, 5
	syscall
	mul $t2, $t1, 4
	add $t3, $t2, $t0
	sw $v0, ($t3)
	addi $t1, $t1, 1
	j loop_in
	
end_in:

	mul $t4, $s0, 4
	add $t5, $t4, $t0
	
	subi $sp, $sp, 32
	sw $ra, 24($sp)
	sw $t5, 20($sp)
	sw $t4, 16($sp)
	sw $t3, 12($sp)
	sw $t2, 8($sp)
	sw $t1, 4($sp)
	sw $t0, 0($sp)
	
	move $a0, $t0
	move $a1, $t5
	jal ORDINA
	
	lw $ra, 24($sp)
	lw $t5, 20($sp)
	lw $t4, 16($sp)
	lw $t3, 12($sp)
	lw $t2, 8($sp)
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	addi $sp, $sp, 32
	
	li $t1, 0
loop_out:
	bge $t1 , $s0, end_out
	mul $t2, $t1, 4
	add $t3, $t2, $t0
	lw $a0, ($t3)
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	addi $t1, $t1, 1
	j loop_out
	
end_out:
	
	li $v0, 10
	syscall
	
ORDINA:
	# $a0 index of vector
	# $a1 num of elem
	
mergesort:
	# $a0 start vector address
	# $a1 end vector adress
	move $t0, $a0
	move $t1, $a1
	
	sub $t2, $t1, $t0
	ble $t2, 4, mergesort_end # array of only 1 elem 
	
	div $t3, $t2, 4
	div $t3, $t3, 2 # mid index
	mul $t3, $t3, 4
	
	add $t4, $t3, $t0
	
	subi $sp, $sp, 32
	sw $ra, 20($sp)
	sw $t4, 16($sp)
	sw $t3, 12($sp)
	sw $t2, 8($sp)
	sw $t1, 4($sp)
	sw $t0, 0($sp) 
	
	move $a0, $t0
	move $a1, $t4
	jal mergesort
	
	lw $ra, 20($sp)
	lw $t4, 16($sp)
	lw $t3, 12($sp)
	lw $t2, 8($sp)
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	addi $sp, $sp, 32
	
	add $t5, $t4, 4
	
	subi $sp, $sp, 32
	sw $ra, 24($sp)
	sw $t5, 20($sp)
	sw $t4, 16($sp)
	sw $t3, 12($sp)
	sw $t2, 8($sp)
	sw $t1, 4($sp)
	sw $t0, 0($sp) 
	
	move $a0, $t5
	move $a1, $t1
	jal mergesort
	
	lw $ra, 24($sp)
	lw $t5, 20($sp)
	lw $t4, 16($sp)
	lw $t3, 12($sp)
	lw $t2, 8($sp)
	lw $t1, 4($sp)
	lw $t0, 0($sp) 
	
	#jal merge
	
mergesort_end:
	
	jr $ra
	
merge:
	# a0 start array address
	# a1 end array address
	move $t0, $a0
	move $t1, $a1
	move $t2, $t0
	
merge_loop:
	ble $t1, $t2, merge_loop_end 
	mul $t7, $t2, 4
	add $t8, $t7, $t6
	lw $t3, ($t8)
	#lw $t4, 
	blt $t3, $t4, no_swap
	move $t5, $t3
	move $t3, $t4
	move $t4, $t5
no_swap:
	addi $t2, $t2, 1
merge_loop_end:
	jr $ra
	

	
	
.data
vec: .word 0:6
n_elem: .word 6
.align 4
virgola: .asciiz ", "