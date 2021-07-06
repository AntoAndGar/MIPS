# Un programma in linguaggio assembly MIPS deve inizializzare quindici valori interi e calcolare la media aritmetica 
# (si deve usare il coprocessore matematico) degli elementi alla posizioni pari, alla posizioni dispari e quella complessiva.

.text
.globl main

main:
	
	li $t1, 0
	li $t2, 0
loop1:
	beq $t1, 15, fineInit
	li $v0, 5
	syscall
	mul $t2, $t1, 4
	sw $v0, vect($t2)
	addi $t1,$t1, 1
	j loop1
	
fineInit:

	li $t1, 0
	li $t2, 0
loop2:
	beq $t1, 15, fineRead
	mul $t2, $t1, 4
	lw $t3, vect($t2)
	rem $t4, $t1, 2
	beqz $t4, pari
	add $t5, $t5, $t3
	j after
pari:
	add $t6, $t6, $t3
after:	
	add $t7, $t7, $t3
	addi $t1,$t1, 1
	j loop2
	
fineRead:
	l.s $f18, quindici
	#cvt.s.w $f18, $f18
	l.s $f14, sette
	#cvt.s.w $f14, $f14
	l.s $f16, otto
	#cvt.s.w $f16, $f16
	mtc1 $t5, $f0
	cvt.s.w $f0, $f0
	mtc1 $t6, $f2
	cvt.s.w $f2, $f2
	mtc1 $t7, $f4
	cvt.s.w $f4, $f4 
	div.s $f6, $f0, $f14
	div.s $f8, $f2, $f16
	div.s $f10, $f4, $f18
	
	mov.s $f12, $f6 
	li $v0, 2
	syscall
	
	mov.s $f12, $f8 
	li $v0, 2
	syscall
	
	mov.s $f12, $f10 
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall

.data
quindici: .float 15.0
sette: .float 7.0
otto: .float 8.0
vect: .space 60