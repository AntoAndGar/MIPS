# Si scriva un programma che definisca in memoria due vettori: V1 un vettore di cinque elementi di byte e V2 un vettore di cinque elementi di halfword.
# Si applichi al programma una funzione:
# SOMMA(V1,V2,V3)
# Che ha come argomenti i due vettori definiti dall'utente V1 e V2 e restituisce il vettore V3 formato dall'elemento più grande alla stessa posizione dei vettori V1 e V2.
# ESEMPIO:
# V1=3,56,12,45,33
# V2=-4,67,89,11,47000
# V3=3,67,89,45,47000

.text
.globl main

main:
	la $a0, v1
	la $a1, v2
	
	jal somma
	move $t0, $v0
	li $t1, 0
main_loop:
	bge $t1, 5, end
	mul $t2, $t1, 2
	add $t3, $t2, $t0
	lh $a0, ($t3)
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	addi $t1, $t1, 1
	j main_loop
end:
	li $v0, 10
	syscall
	
somma:
	# a0 address of 1st vector
	# a1 address of 2nd vector
	li $t0, 0
	la $t6, v3
loop_somma:
	bge $t0, 5, end_somma
	mul $t1, $t0, 2
	add $t2, $t0, $a0
	add $t3, $t1, $a1
	add $t7, $t1, $t6
	lb  $t4, ($t2)
	lh $t5,($t3)
	sh $t5, ($t7)
	bge $t5, $t4, no_change
	sh $t4, ($t7)
no_change:
	addi $t0, $t0, 1
	j loop_somma
end_somma:
	move $v0, $t6
	jr $ra
	
.data
v1: .byte 3, 56, 12, 45, 33
v2: .half -4, 67, 89, 11, 47000 #47000 e' troppo grande per la rappresentazione in halfword quindi sarà un qualche numero negativo 
v3: .half 0:5
virgola: .asciiz ", "
