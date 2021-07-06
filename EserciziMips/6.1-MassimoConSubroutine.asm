# Implementare in linguaggio asembly MIPS un programma che calcola il massimo tra n elementi immessi in input (la lettura termina quando si introduce un numero negativo. 
# Utilizzare la sub-routine (funzione) MASSIMO che presi due elementi restituisce il massimo.
# Esempio
# INPUT:
# 45; 66; 34; 156; 233; 234; 56; 0 ; -11
# ANALISI
# MASSIMONUM(45, 66, 34, 156,233,234,56,0,-11)=234
# MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(45,66),34),156),233),234),56),0)=234
# OUTPUT: 234

.text
.globl main

main:

	li $v0, 5
	syscall
	move $t0, $v0
loop:
	bltz $t1, fineInput
	li $v0, 5
	syscall
	move $t1, $v0
	move $a0, $t0
	move $a1, $v0
	jal MASSIMO
	move $t0, $v0
	j loop
	
fineInput:
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
MASSIMO:
	bgt $a0, $a1, set_max
	move $v0, $a1
	j return	
set_max:
	move $v0, $a0
return:
	jr $ra
	
.data