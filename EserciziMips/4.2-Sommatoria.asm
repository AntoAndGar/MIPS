# Effettuare la sommatoria di numeri reali poistivi immessi da input. La sommatoria è calcolata quando il valore immesso dall'utente è nullo o negativo.
# INPUT
# 3.5;7.23;5.6;9.17;-1
# OUTPUT
# 25.5

.text
.globl main

main:
	#l.d $f4, uno
	l.d $f10, zero
loop:
	li $v0, 7
	syscall
	c.lt.d $f10, $f0
	bc1f stampa
	add.d $f2, $f2, $f0
	#add.d $f6, $f6, $f4
	j loop

stampa:
	#div.d $f8, $f2, $f6
	
	mov.d $f12, $f2
	li $v0, 3
	syscall
	
	li $v0, 10 
	syscall
	
.data
zero: .double 0.0
uno: .double 1.0