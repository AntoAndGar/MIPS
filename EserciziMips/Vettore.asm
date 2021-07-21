# Definire due vettori di 5 elementi x di valore -2 32 <x i <2 32 -1 e
# memorizzare in un nuovo vettore solamente gli elementi in posizione dispari
# Esempio:
# vIN=(3,5,8,10,1)
# vOUT= (3,5,1)

.text
.globl main

main:
	la $t0, vin
	li $t1, 1
	lw $t9, num_elem
	la $s0, vout
	
loop:
	blt $t9, $t1, end_loop
	rem $t5, $t1, 2
	beqz $t5, no_add
	subi $t4, $t1, 1
	mul $t2, $t4, 4
	add $t3, $t0, $t2
	lw $t6, ($t3)
	mul $t7, $t8, 4
	add $s1, $s0, $t7
	sw $t6, ($s1)
	addi $t8, $t8, 1
no_add:
	addi $t1, $t1, 1
	j loop
	
end_loop:
	
	li $v0, 10
	syscall
	
.data 
vin: .word 3,5,8,10,1
vout: .word 0:5
num_elem: .word 5