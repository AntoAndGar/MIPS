# Scrivere un programma in linguaggio assembly MIPS che legga una stringa introdotta da tastiera. La stringa contiene sia caratteri maiuscoli che caratteri minuscoli, 
# e complessivamente al più 255 caratteri. Il programma deve svolgere le seguenti operazioni:
# - visualizzare la stringa inserita
# - stampare a video l'uppercase della stringa
# Ad esempio la frase "Che Bella Giornata" diviene "CHE BELLA GIORNATA".

.text
.globl main

main:
	la $a0, stringa
	li $a1, 255
	li $v0, 8	
	syscall
	
	li $v0, 4
	syscall
	
	li $t4, 122
	li $t6, 96
loop:
	beq $t0, $a1, fine
	lb $t2, stringa($t0)
	slt $t3, $t2, $t4
	sgt $t5, $t2, $t6
	and $t7, $t3, $t5
	bne $t7, 1, gia_upper
	subi $t2, $t2, 32
gia_upper:
	sb $t2, stringa($t0)
	addi $t0, $t0, 1
	j loop
	
fine:
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
.data
stringa: .space 255