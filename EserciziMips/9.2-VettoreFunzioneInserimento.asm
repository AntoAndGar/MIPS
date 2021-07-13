# Inizializzare, con valori casuali, un vettore di dimensione 10 con elementi word e realizzare la funzione
# INS(vettore, DIM, ELEM, POS)
# che inserisce l'elemento ELEM (immesso da tastiera) alla posizione POS (immessa da tastiera) slittando a destra gli elementi successivi alla posizione di inserimento
# ESEMPIO:
# v1=555,6,710,33,6071,789,5,-67,99,1000
# lunghezzav1=10
# INS(v1,10,2312,6)
# v1=555,6,710,33,6071,2312,789,5,-67,99,1000
# lunghezzav1=11
# PS: per evitare la gestione del caso in cui l'utente inserisca una posizione al di fuori dal range [0,9] si consiglia di stamapre su videoterminale un segnale di avvertimento

.text
.globl main

main:
	la $a0, vec
	li $a1, 10
	jal init_vect
	move $t0, $v0 	# t0 address of initalized vec
	
	#immissione elemento dall'input
	li $v0, 5
	syscall
	move $t1, $v0 
	
	#immissione posizione di inserimento
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $t6, 9
	#verifica pos nei limiti
	sgt $t3, $t2, $zero
	slt $t4, $t2, $t6
	and $t5, $t3, $t4
	beq $t5, 1, no_err
	la $a0, err
	li $v0, 4
	syscall
	j fine
no_err:
	move $a0, $t0
	li $a1, 10
	move $a2, $t1
	move $a3, $t2
	jal ins
	
	move $t0, $v0
	move $t1, $v1
	li $t2, 0
print:
	ble $t1, $t2, fine
	mul $t3, $t2, 4
	add $t4, $t3, $t0
	addi $t2, $t2, 1
	lw $a0, ($t4)
	li $v0, 1
	syscall
	la $a0, virgola
	li $v0, 4
	syscall
	j print
	
fine:
	li $v0, 10
	syscall
	
		
ins:
	move $t0, $a0 #indirizzo vettore 
	move $t1, $a1 #dimensione vettore
	move $t2, $a2 #elemento da inserire
	move $t3, $a3 #posizione di inserimento
	
	#crea un nuovo vettore con dim+1 rispetto al precedente e copia tutti i valori del primo + il nuovo valore
	addi $t4, $t1, 1
	li $t5, 0
	mul $t4, $t4, 4
	move $a0, $t4
	li $v0, 9 #sbrk
	syscall
	move $s0, $v0
	
pre_ins:	
	beq $t3, $t5, inserimento
	
	mul $t6 , $t5, 4
	add $t7 , $t6 , $t0
	add $t9, $t6, $s0
	lw $t8, ($t7)
	sw $t8, ($t9)
	addi $t5, $t5, 1 
	j pre_ins
inserimento:
	mul $t6 , $t5, 4
	add $t7 , $t6 , $t0
	add $t9, $t6, $s0
	#lw $t8, ($t7)
	sw $t2, ($t9)
	addi $t5, $t5, 1 
post_ins:
	addi $t4, $t1, 1
	beq $t5, $t4 end_ins
	
	mul $t6 , $t5, 4
	add $t7 , $t6 , $t0
	add $t9, $t6, $s0
	lw $t8, -4($t7)
	sw $t8, ($t9)
	addi $t5, $t5, 1 
	j post_ins
end_ins:
	move $v0, $s0
	move $v1, $t5
	jr $ra
	

init_vect:
	move $t0, $a0
	move $t1, $a1
	li $t2, 0
init_loop: 
	ble $t1, $t2, end_init
	mul $t3, $t2, 4
	li $v0, 42
	syscall
	add $t4, $t3, $t0
	addi $t2, $t2, 1
	sw $a0, ($t4)
	j init_loop
end_init:
	move $v0, $t0
	jr $ra


	
.data
vec: .word 0:10
vec1: .word 0
err: .asciiz "errore nelle posizione, immettere numero tra 0 e 9\n"
virgola: .asciiz ", "
