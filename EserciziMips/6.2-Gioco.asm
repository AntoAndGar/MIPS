# Nella battaglia virtuale STUDENT BATTLE la milizia A composta da 100 informatici si posiziona ad una certa distanza dalla milizia B di 100 sociologhi. 
# Gli informatici hanno un mortaio con cui sparare delle bombe di colore che colpiscono 10 persone e un elaboratore MIPS; 
# mentre la milizia dei sociologhi dispone di libri di guerra e di una imponenente bomba ad acqua fredda che può colpire 100 persone.
# Il generale comanda alla truppa degli informatici di muoversi ogni due minuti di dieci metri dalla distanza di 123 metri iniziali per evitare di essere colpiti
# in pieno dalla bomba ad acqua dei sociologhi e nel contempo chiede ai suoi capitani di realizzare un programma MIPS per determinare, in tempi rapidi, 
# la velocità necessaria per far percorrere alle bombe di colore la giusta distanza (supponendo che il mortaio abbia una inclinazione fissa di 45°) al variare dei propri spostamenti.
# Il calcolo della distanza della traiettoria deve essere realizzato con la funzione GITTATA (vo^2/g).
# NB: g=9,823m/s^2
# Esempio:
# Distanza:123 metri
# Calcolo velocità:...
# Numero vittime sociologhi:90
# ...
# Ditanza:133 Calcolo velocità:...
# Numero vittime sociologhi:80
# ...
# fino ad esaurimento dei sociologhi
# PS: per rendere il gioco interessante usare la syscall random per determinare degli spostamenti generici.

.text
.globl main

main:
	lw $t2, n_sociologhi
loop:
	beqz $t2, fine
	la $a0, dist
	li $v0, 4
	syscall
	
	lw $a0, pos
	li $v0, 1
	syscall
	move $t0, $a0
	
	la $a0, capo
	li $v0, 4
	syscall
	
	la $a0, vel
	li $v0, 4
	syscall
	
	move $a0, $t0
	jal GITTATA
	mtc1 $v0, $f12
	
	li $v0, 2
	syscall
	
	la $a0, capo
	li $v0, 4
	syscall
	
	subi $t2, $t2, 10
	la $a0, n_vittime
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, capo
	li $v0, 4
	syscall
	
	li $a1, 15  #Here you set $a1 to the max bound.
    	li $v0, 42  #generates the random number.
    	syscall
    	
    	add $t0, $t0, $a0
    	sw $t0, pos
	
	j loop
	
fine:
	li $v0, 10
	syscall
	
GITTATA:
	mtc1 $a0, $f0
	cvt.s.w $f0, $f0
	l.s $f1, g
	mul.s $f2, $f0, $f1
	sqrt.s $f3, $f2
	mfc1 $v0, $f3
	jr $ra
	
.data
#n_informatici: .word 100
n_sociologhi: .word 100
pos: .word 123
g: .float 9.823
dist: .asciiz "Distanza: "
vel: .asciiz "Calcolo velocita': "
n_vittime: .asciiz "Numero vittime sociologhi: " 
capo: .asciiz "\n"
