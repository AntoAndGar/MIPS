# Implementare un programma in linguaggio assembly MIPS che:
# stampa a video “Primo numero: ” e prenda in input un numero a
# stampa a video “Secondo numero: ” e prenda in input un numero b
# stampa a video “Prodotto dei due numeri: ” e stampi a video axb

# Esempio
# OUTPUT: Primo Numero:
# INPUT:5
# OUTPUT:Secondo Numero:
# INPUT:6
# OUTPUT: Prodotto dei due numeri:30

.text
.globl main

main:
	la $a0, s_uno
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $a0, s_due
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	mul $t2, $t1, $t0
	
	la $a0, s_result
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.data
s_uno: .asciiz "Primo numero: "
s_due:	.asciiz "Secondo numero: "
s_result: .asciiz "Prodotto dei due numeri: "