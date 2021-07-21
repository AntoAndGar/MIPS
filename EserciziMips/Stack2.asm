# Si consideri la funzione f definita su interi
# f(x,y) = 2*f(x-2,y-5)
# f(0,y) = 1
# f(x,0) = 2
# f(0,0)=3
# Si realizzi un programma in assembler MIPS che,definiti due interi
# positivi x≥2 e y ≥2, calcola il corrispondente valore di f(x,y) in modo ricorsivo
# ESEMPIO:
# f(4,25)=2*f(2,20) =2*2*f(0,15) =2*2*1 =2*2*1=4
# f(8,10)=2*f(6,5) =2*2*f(4,0) =2*2*2=8
# f(4,10)=2*f(2,5)=2*2*f(0,0)=2*2*3=12

.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	li $v0, 5
	syscall
	move $a1, $v0

	jal ric
	move $a0, $v0	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
ric:
	beqz $a0, base
	beqz $a1, base
	subi $sp, $sp, 8
	sw $ra, 0($sp)
	subi $a0, $a0, 2
	subi $a1, $a1, 5
	jal ric
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	mul $v0, $v0, 2
	jr $ra
	
base:
	beq $a0, $a1, tre
	beqz $a1, due
	li $v0, 1
	j base_end
due:
	li $v0, 2
	j base_end			
tre:
	li $v0, 3
base_end:
	jr $ra
	
.data
