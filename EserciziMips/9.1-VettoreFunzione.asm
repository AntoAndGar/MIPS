# Scrivere un programma che inizializza un vettore di 10 elementi a 16bit con valori casuali compresi tra 0 e 65000 e che copia
# in un nuovo vettore il quadrato degli elementi del primo (utilizzare una funziona per realizzare il quadrato degli elementi).
# ESEMPIO:
# v1= 5,60000,0,1,45,76,99,456,4321,12876
# v2= 25,3600000000,0,1,2025,5776,9801,207936,18671041,165791376

.text
.globl main

main:
	la $t0, vec
	li $t1, 0
	lh $t4, n_elem
loop:
	ble $t4, $t1, end_loop
	
	li $a1, 65000
	li $v0, 42
	syscall
	
	mul $t2, $t1, 2
	add $t3, $t2, $t0
	sh $a0, ($t3)
	
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1
	j loop
	
end_loop:
	la $a0, riga
	li $v0, 4
	syscall

	move $a0, $t0
	move $a1, $t4 
	jal quadrato
	
	move $t0, $v0
	lh $t1, n_elem
	li $t2, 0
print:
	ble $t1, $t2, end_print
	mul $t3, $t2, 4
	add $t4, $t3, $t0
	addi $t2, $t2, 1
	lw $a0, ($t4)
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	j print
end_print:
	
	li $v0, 10
	syscall
	
quadrato:
	# prende in input un vettore e il numero di elementi e ne effettua il quadrato, restituendo un secondo vettore
	# a0, vect
	# a1, num elem
	move $t0, $a0
	li $t1, 0
	move $t4, $a1
	la $t6, vec2
quad_loop:
	ble $t4, $t1, end_quad_loop
	
	mul $t2, $t1, 2
	add $t3, $t2, $t0
	lh $t9, ($t3)
	mul $t8, $t1, 4
	mul $t5, $t9, $t9
	add $t7, $t8, $t6
	sw $t5, ($t7) 
	
	addi $t1, $t1, 1
	j quad_loop
	
end_quad_loop:
	move $v0, $t6
	jr $ra


.data
virgola: .asciiz ", "
riga: .asciiz "\n"
.align 4
vec: .half 0:10
.align 4
vec2: .word 0:10
n_elem: .half 10
