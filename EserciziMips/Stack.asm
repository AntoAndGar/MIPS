# Si consideri la funzione f definita su interi
# f(x) = f(x-2) – 2
# f(1) = 14
# f(0) = 10
# Si realizzi un programma in assembler MIPS che,definito un intero
# positivo x≥2, calcola il corrispondente valore di f(x) in modo ricorsivo
# ESEMPIO:
# f(6)=f(4)-2=(f(2)-2)-2=((f(0)-2)-2)-2=10-2-2-2=4
# f(5)=f(3)-2=f(1)-2-2=14-2-2=10

.text
.globl main

main:
	li $v0, 5
	syscall
	
	move $a0, $v0
	jal ric
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
ric:
	move $t0, $a0
	ble $t0, 1, ret14
	subi $sp, $sp, 8
	sw $ra, 4($sp)
	sw $t0, 0($sp)
	subi $t0, $t0, 2
	move $a0, $t0
	jal ric
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	subi $v0, $v0, 2
	jr $ra
ret14:
	li $v0, 14
	bnez $t0, ret
	li $v0, 10
ret:
	jr $ra 
	
	
	
.data