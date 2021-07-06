# Leggere 7 valori interi da input e calcolarne la media (stampandola a video).
# INPUT
# 12;82;11;2345;67;123456;675
# OUTPUT
# 18092.57142857
# NB: La media deve essere espressa con un numero reale (float). Utilizzare il coprocessore matematico.

.text
.globl main

main:
	lw $t2, cardinality
loop:
	beq $t0, $t2, media
	li $v0, 5
	syscall
	add $t1, $t1, $v0
	add $t0, $t0, 1
	j loop

media:
	mtc1 $t1, $f2
	#cvt.s.w $f2, $f2  perchè questa non va usata?
	l.s $f4, cardinality
	div.s $f6, $f2, $f4
	
	mov.s $f12, $f6
	li $v0, 2
	syscall
	
	li $v0, 10 
	syscall
	
.data
cardinality: .word 7